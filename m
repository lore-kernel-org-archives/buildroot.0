From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 22:45:36 +0100
Subject: [Buildroot] Need arm-buildroot config and arm-linux config
In-Reply-To: <509C0717.7030100@petroprogram.com>
References: <509C0717.7030100@petroprogram.com>
Message-ID: <509C2800.4080900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 20:25, Stefan Fr?berg wrote:
> Hello everyone
>
> I have now tried several times to build working arm-virtual image for
> use with qemu.
> Once i even managed to run it with qemu but then I made some changes
> that I don't remember anymore
> and it has stopped working again (just black screen in qemu).
>
> Could somebody kindly provide a minimal (just kernel, uclibc and busybox
> is enough),
> working arm buildroot .config and arm kernel .config  so
> that I can run it under qemu, so that I can finally start testing
> firefox under arm, so that
> I can finally kick the updated, cleaned firefox patch out before
> Christmas :-)

  Do qemu_arm_versatile_defconfig or qemu_arm_vexpress_defconfig not work
for you?  See board/qemu/arm-versatile/readme.txt for instructions how
to run qemu.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
