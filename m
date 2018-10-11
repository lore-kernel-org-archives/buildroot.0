From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Oct 2018 13:02:03 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <996f7ba6-2a05-8a81-f3f8-75b179d40cd6@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

Il 10/10/2018 17:48, Thomas Petazzoni ha scritto:
>>       powerpc |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/78061b61cfe3f42554a475c048d54dacacfe11d5 |
> 
> 
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libavutil.a(hwcontext_drm.o): In function `drm_device_create':
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/ffmpeg-3.4.4/libavutil/hwcontext_drm.c:50: undefined reference to `drmGetVersion'
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/ffmpeg-3.4.4/libavutil/hwcontext_drm.c:63: undefined reference to `drmFreeVersion'
> 
> Giulio, I believe you worked on this static linking problem between
> ffmpeg and libdrm. What is the status of this ?

I still have to fix it and I'm currently illed(I think I need 1 week to 
recover, I hope). Need also to ask something about solving it.
Going to do it on the e-mails regarding that patch.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
