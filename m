From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 2 Mar 2017 14:35:50 +0100
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
Message-ID: <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Thu, Mar 2, 2017 at 2:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
> Hi,
>
> I'm trying to build Qt5 for imx6q sabre and enabled eglfs through
> BR2_PACKAGE_QT5BASE_EGLFS
>
> Any idea, did I miss anything?

Here is a defconfig made for 2016.11.1 version of Buildroot for
Nitrogen6x (i.MX6Q) which has EGLFS support:
http://boundarydevices.com.commondatastorage.googleapis.com/buildroot-v2016.11.1-nitrogen6x-qt5.6.2_defconfig

Please use that config making sure to replace the kernel and u-boot
components for your board first.

Regards,
Gary
