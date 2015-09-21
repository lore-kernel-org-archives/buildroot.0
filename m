From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 21 Sep 2015 10:11:11 +0200
Subject: [Buildroot] [PATCH 00/14] Update Freescale packages to
	3.14.28-1.0.0_ga
In-Reply-To: <20150919154221.11c7b2f7@free-electrons.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
 <20150919154221.11c7b2f7@free-electrons.com>
Message-ID: <CAAMH-yuV1dc+h_dYzPBVfhAbdqY0g1AhZLoqkX9NV7nr9p5Tjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Sep 19, 2015 at 3:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Gary,
>
> On Wed,  9 Sep 2015 22:20:49 +0200, Gary Bisson wrote:
>
>> Gary Bisson (14):
>>   freescale-imx: bump to 3.14.28-1.0.0_ga release
>
> Applied.
>
>>   kobs-ng: remove obsolete package
>>   imx-kobs: add new package
>
> Those two not applied. I'll reply on the imx-kobs package why.

I will take a look at it today.

>>   imx-gpu-viv: bump version to 5.0.11 p4.5
>>   xdriver_xf86-video-imx-viv: bump to version 5.0.11 p4.5
>>   libfslcodec: bump version to 4.0.3
>>   libfslparser: bump version to 4.0.3
>>   libfslvpuwrap: bump version to 1.0.58
>>   gst-fsl-plugins: bump version to 4.0.3
>>   gst1-imx: bump version to 0.11.1
>>   freescale_imx6*_defconfig: bump version to 3.14.28-1.0.0_ga
>>   qmx6_defconfig: bump version to 3.14.28_1.0.0
>>   nitrogen6x_defconfig: bump version to 3.14.28-1.0.0
>>   board/boundarydevices: update u-boot script for 3.14 kernels
>
> All those patches applied.

Thank you! Could you also apply Baruch VPU changes since all my
testing was done with his patches applied (plus they are harmless):
http://patchwork.ozlabs.org/patch/513580/
http://patchwork.ozlabs.org/patch/513579/

Thanks,
Gary
