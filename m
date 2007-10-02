From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 2 Oct 2007 22:41:16 +0200
Subject: [Buildroot] Error with building ARM cross toolchain using
	buildroot
References: <543018.86390.qm@web7906.mail.in.yahoo.com>
Message-ID: <00f201c80534$e2ab3b10$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com Best AVR
link: www.avrfreaks.net
----- Original Message ----- 
From: "ashok vardhan" <rashokvardhan@yahoo.co.in>
To: <buildroot@uclibc.org>
Sent: Monday, October 01, 2007 12:50 PM
Subject: [Buildroot] Error with building ARM cross toolchain using buildroot


> Hi Sir/Madam,
> I did the things as suggested by Sir/Madam Brian Austin. I successfully 
> downloaded and  I extracted the tar file. I shown a brief things regarding 
> this below.............
>
> http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2, 
> buildroot  buildroot-snapshot.tar.bz2
>
> [root at knowx4 buildroot]# make menuconfig
>
> [root at knowx4 buildroot]# make
> ALL tar files related to the configuration done by me are downloaded.
>
> rm -rf 
> /root/porting/tools/buildroot/project_build_arm/uclibc/buildroot-config
> mkdir -p /root/porting/tools/buildroot/project_build_arm/uclibc
> cp -dpRf package/config/buildroot-config 
> /root/porting/tools/buildroot/project_build_arm/uclibc/buildroot-config
> cp -dpf 
> /root/porting/tools/buildroot/project_build_arm/uclibc/linux-2.6.22.1/.config
> cp: missing destination file
> Try `cp --help' for more information.
> make: *** 
> [/root/porting/tools/buildroot/project_build_arm/uclibc/linux-2.6.22.1/.configured] 
> Error 1
>
> [root at knowx4 buildroot]# ls
> binaries   Config.in  docs      package  project_build_arm  TODO 
> toolchain_build_arm
> build_arm  dl         Makefile  project  target             toolchain
>
> Please give some suggestive solutions regarding this error............
> Thanking You Sir/Madam.
>

Yes, please think about why the following Linux comimand fails:

$ cp a

and you will have half the answer.


> Regards,
> Ashok
>


Best Regards
Ulf Samuelsson
