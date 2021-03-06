LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    src/mm_camera_interface.c \
    src/mm_camera.c \
    src/mm_camera_channel.c \
    src/mm_camera_stream.c \
    src/mm_camera_thread.c \
    src/mm_camera_sock.c \
    src/cam_intf.c

ifeq ($(call is-board-platform-in-list, msm8974 msm8226 msm8610),true)
    LOCAL_CFLAGS += -DVENUS_PRESENT
endif

ifeq ($(TARGET_DEVICE), find7)
    LOCAL_CFLAGS += -DFLIP_BACK_SENSOR_MOUNT_ANGLE
endif

LOCAL_CFLAGS += -D_ANDROID_

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/inc \
    $(LOCAL_PATH)/../common \
    $(call project-path-for,qcom-media)/mm-core/inc \
    system/media/camera/include

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include/media
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_CFLAGS += -Wall -Werror

LOCAL_MODULE := libmmcamera_interface
LOCAL_SHARED_LIBRARIES := libdl libcutils liblog
LOCAL_HEADER_LIBRARIES += camera_common_headers
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
