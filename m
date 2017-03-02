From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 2 Mar 2017 22:31:41 +0530
Subject: [Buildroot] Fwd:  libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
Message-ID: <CAD6G_RTOApiZH3pUcTPsRoKCq2qWnCSNRY4abLJz1fvcD3FHjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Thu, Mar 2, 2017 at 7:05 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Hi Jagan,
>
> On Thu, Mar 2, 2017 at 2:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>>
>> Hi,
>>
>> I'm trying to build Qt5 for imx6q sabre and enabled eglfs through
>> BR2_PACKAGE_QT5BASE_EGLFS
>>
>> Any idea, did I miss anything?
>
> Here is a defconfig made for 2016.11.1 version of Buildroot for
> Nitrogen6x (i.MX6Q) which has EGLFS support:
> http://boundarydevices.com.commondatastorage.googleapis.com/buildroot-v2016.11.1-nitrogen6x-qt5.6.2_defconfig

Thanks for the help.

>
> Please use that config making sure to replace the kernel and u-boot
> components for your board first.

Yeah, I was able to build eglfs, and finally I'm launching some demo
application.

# /usr/share/Qtdemo -platform eglfs
QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2
to enable double buffering and vsync.
 If this is not desired, you can override this via: export
QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
Could not open egl display
Aborted

Please let me know if have any idea about this error?

thanks!
--
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.


-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
