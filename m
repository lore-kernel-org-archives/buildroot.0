From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 6 Mar 2017 09:18:29 -0300
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RTiZFhEVenFUCY1-EPmHq2ahnaXeE9oe9uQavzcXjpWNQ@mail.gmail.com>
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
 <CAOMZO5CBQVEMBLNgWRL947_uRpCDbyy5tTUVBfNjMkiwjyoA4Q@mail.gmail.com>
 <CAD6G_RQ3bLbJGi2jdRB-mafn4s=iHpvscjP+ggdBQG7_570ECA@mail.gmail.com>
 <CAD6G_RT58-HC8mi2g7Aq0x72uac0mUTA=HgoMAd1uAB-BWrXEQ@mail.gmail.com>
 <CAD6G_RQ_00ozMXZJ4GaTR5ETny-wJk6GkHbPSHLGQjiHUJR9dg@mail.gmail.com>
 <CAOMZO5AB2xYjvjQkvYp8y++M=95SnJSPbkPsv-sqs0VciYDd-w@mail.gmail.com>
 <CAD6G_RTyUUwWdMOy-9Tmam+uc=0UEJi9SjRBNypRw+x5UTgywg@mail.gmail.com>
 <CAAMH-ytkp7TDYwN12GJ=D-BXsyQg5ThD=3LCwyYwby-Rk+Vxig@mail.gmail.com>
 <CAOMZO5CufYJ7vqRw_7LxKpWtJe3Z-1U3=8SOubJXLgvNfO3Rew@mail.gmail.com>
 <CAOMZO5D5FB68ZWCqLd0HB14g3AQQRC556bgSXT-RznGB-xjqdA@mail.gmail.com>
 <CAAMH-yv5Ty14joyypR2oYOT+fYqi+VBtZWb7ES1ZAF7FaBG_nw@mail.gmail.com>
 <CAOMZO5DtKGj3O_9p8H7ewbdq7ahTW=ZRCsVNcMZSGyz8Gxypyg@mail.gmail.com>
 <CAOMZO5DdsuQ29+KyMmvE8Ye5W2_a=-SZaCYKMP_MNoCHb07zaQ@mail.gmail.com>
 <CAOMZO5Be5Y_81g8F1to4kRX7e3TgOqRa6-kVXti0C5pchzCW1w@mail.gmail.com>
 <CAAMH-ysZ-QBLyRy3krifSj5p98d=Aw5pEih07x6cHGHW4bFpWQ@mail.gmail.com>
 <CAD6G_RQ5FB9gJYvfz8Z0cRLhUSrjjXUaG13YdbbGdJJ-8E=BCw@mail.gmail.com>
 <CAD6G_RTkmybL1PSc_sMPSZHkoSquV5D+9wvCervaJFbj9R2_1w@mail.gmail.com>
 <CAOMZO5BA-0Yp4ToB-ALHdu5HoOGCjKy6PELuPZDcmYXCsnQJdg@mail.gmail.com>
 <CAD6G_RTiZFhEVenFUCY1-EPmHq2ahnaXeE9oe9uQavzcXjpWNQ@mail.gmail.com>
Message-ID: <CAOMZO5Dt4ybMPMErTH3kk73sKBprCxvxCONCG=7HzGZu+AYsYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 6, 2017 at 9:08 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:

> - CinematicExperience:
> -----------------------------
> - demo launched but 'Black' object on list like 'Lord of the Rings' etc
>
> # CinematicExperience-demo
> MESA-LOADER: device is not located on the PCI bus
> MESA-LOADER: device is not located on the PCI bus
> MESA-LOADER: device is not located on the PCI bus
> Failed to move cursor on screen LVDS1: -14
> libpng warning: iCCP: known incorrect sRGB profile
> libpng warning: iCCP: known incorrect sRGB profile
> QOpenGLFramebufferObject: Unsupported framebuffer format.
> QOpenGLFramebufferObject: Framebuffer incomplete, missing attachment.
> QOpenGLFramebufferObject: Unsupported framebuffer format.
> QOpenGLFramebufferObject: Framebuffer incomplete, missing attachment.
> QOpenGLFramebufferObject: Unsupported framebuffer format.
> QOpenGLFramebufferObject: Framebuffer incomplete, missing attachment.
> QOpenGLFramebufferObject: Unsupported framebuffer format.
> QOpenGLFramebufferObject: Framebuffer incomplete, missing attachment.

I also saw this defect here. Would be nice to understand where it comes from.

Gary,

Do you have the Buildroot hash that your demo was generated from?

Thanks
