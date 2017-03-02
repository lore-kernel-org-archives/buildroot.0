From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 2 Mar 2017 15:36:01 -0300
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RSOBrZvE-4O_6uTj+0pBvsrM56p-48Rxd2hQZHtq8XkGw@mail.gmail.com>
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
 <CAD6G_RQNzT_yQfQeHW-VNE3vAhSnCRStc1R2NHrbkJwtHD=mzA@mail.gmail.com>
 <CAD6G_RSOBrZvE-4O_6uTj+0pBvsrM56p-48Rxd2hQZHtq8XkGw@mail.gmail.com>
Message-ID: <CAOMZO5CBQVEMBLNgWRL947_uRpCDbyy5tTUVBfNjMkiwjyoA4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 2, 2017 at 3:32 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:

> [   87.631131] ------------[ cut here ]------------
> [   87.635799] WARNING: CPU: 2 PID: 275 at
> drivers/gpu/drm/drm_atomic_helper.c:1149
> drm_atomic_helper_wait_for_vblanks+0x218/0x228
> [   87.647319] [CRTC:26] vblank wait timed out

I think Phillip Zabel posted a recent series to address this issue 4.10 issue.

Does kmscube work on 4.9.13 for you?
