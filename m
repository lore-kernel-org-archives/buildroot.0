From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 2 Mar 2017 23:58:30 +0530
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAOMZO5Acb8RJZdf95uGj8w5LyhnjCh=sZoj=NE24wN_K2nO_OQ@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
 <CAAMH-ys=MpSuBvT=weVPKhyu5_bz4feq7ePmMN4LgHKubG_9vQ@mail.gmail.com>
 <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
 <CAOMZO5B_d9-oq9R1NciG7F3A-HKhHVWP8uXzM=Crx2YB+zFVnw@mail.gmail.com>
 <CAD6G_RQZuqQphZqB0QwLKBC2Ox5G_tp06WTfUMEuOL6=LA2UvQ@mail.gmail.com>
 <CAOMZO5BWQvPFNevSp8Hjz4knfQ7kTYGmgXutoyzvb_ejq5AhpA@mail.gmail.com>
 <CAD6G_RSC9+NwdQP3qRA=wLWm2SaVNeN=zJXVR6P6dk8i+xLbxg@mail.gmail.com>
 <CAOMZO5BGTbB8WM-+oS9CoC8_3TPsZhyq1t-3=SJk1uAms8jBmQ@mail.gmail.com>
 <CAD6G_RRfwho6qwBU=QtyR6AsuNtGgWvvSFbTjwLwzv+9dqA6-Q@mail.gmail.com>
 <CAOMZO5Acb8RJZdf95uGj8w5LyhnjCh=sZoj=NE24wN_K2nO_OQ@mail.gmail.com>
Message-ID: <CAD6G_RQNzT_yQfQeHW-VNE3vAhSnCRStc1R2NHrbkJwtHD=mzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 2, 2017 at 11:37 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Mar 2, 2017 at 3:06 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
>> Linux version 4.10.0-rc8-next-20170217-00002-g5c07a3d-dirty
>
> Well, not a very stable kernel base :-)
>
> I would recommend you to trying 4.9.13 or 4.10.1.

Yeah, I've tried 4.10.1 same issue but some how bigger red flash
compared to previous.


Log:
# cat /proc/version
Linux version 4.10.1 (root at d7d7e20b645f) (gcc version 4.9.0 (GCC) ) #1
SMP Thu Mar 2 18:23:17 UTC 2017
# kmscube
trying to load module exynos...failed.
trying to load module i915...failed.
trying to load module imx-drm...success.
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
Using display 0x105a398 with EGL version 1.4
EGL Version "1.4 (DRI2)"
EGL Vendor "Mesa Project"
EGL Extensions "EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import
EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
EGL_KHR_fence_sync EGL_K
HR_get_all_proc_addresses EGL_KHR_gl_renderbuffer_image
EGL_KHR_gl_texture_2D_image EGL_KHR_gl_texture_cubemap_image
EGL_KHR_image EGL_KHR_image_base EG
L_KHR_image_pixmap EGL_KHR_no_config_context EGL_KHR_reusable_sync
EGL_KHR_surfaceless_context EGL_KHR_wait_sync
EGL_MESA_configless_context EGL_MESA_dr
m_image EGL_MESA_image_dma_buf_export "
GL Extensions: "(null)"


-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
