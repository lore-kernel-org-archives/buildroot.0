From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Sep 2015 14:13:30 +0200
Subject: [Buildroot] [PATCH v2 1/1]
 package/x11r7/xdriver_xf86-video-ati: Fix DRI-related build
References: <1443351264-9312-1-git-send-email-bernd.kuhls@t-online.de>
 <5607D7A4.8020903@imgtec.com>
Message-ID: <a43ldcxmbf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 27 Sep 2015 12:48:52 +0100 schrieb Vicente Olivert Riera:

> And I managed to build xdriver_xf86-video-ati for MIPS architecture
> successfully, after enabling BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON for
> all architectures.

Hi,

it is possible to build the package for various archs, but does it make 
sense? V2 of my patch picks up a comment by Peter:
http://patchwork.ozlabs.org/patch/512209/
"Is there any realistic use cases for anything besides x86 / x86-64?"

Regards, Bernd
