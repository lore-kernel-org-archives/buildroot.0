From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 23 Aug 2009 12:01:08 +0200
Subject: [Buildroot] buildroot Digest, Vol 38, Issue 69 ARM 2.6.30.5
In-Reply-To: <mailman.145.1251447477.14877.buildroot@busybox.net>
References: <mailman.145.1251447477.14877.buildroot@busybox.net>
Message-ID: <517EDD06A58343A9BDC8B2AB06DC0CBE@Tablet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi

I already have the 2.6.30 + patchlevel 5  running for ARM in buildroot
I am on holiday noww and only have my laptop here, i can sent you files to 
include/ change this weekend if you like. Maybe they could be included then 
in the final 08 release.
Basically i included the patch from the maxim.za site into buildroot and 
changed the config.in file to include the new choice into the menus.

Johan


----- Original Message ----- 
From: <buildroot-request@busybox.net>
To: <buildroot@busybox.net>
Sent: Friday, August 28, 2009 10:17 AM
Subject: buildroot Digest, Vol 38, Issue 69


> Send buildroot mailing list submissions to
> buildroot at busybox.net
>
> To subscribe or unsubscribe via the World Wide Web, visit
> http://lists.busybox.net/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
> buildroot-request at busybox.net
>
> You can reach the person managing the list at
> buildroot-owner at busybox.net
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
>
>
> Today's Topics:
>
>   1. Linux Kernel 2.6.30 for ARM (Dan Pattison)
>   2. Re: Linux Kernel 2.6.30 for ARM (Peter Korsgaard)
>   3. [Bug 527] misc fixes for dnsmasq package (bugzilla at busybox.net)
>   4. Re: gmp error with git version (Jonathan dumaresq)
>   5. Does the kexec package buildroot-2009.05 for i386? (Bill Bogstad)
>   6. Re: [git commit master] u-boot: mark old 2008.10 version as
>      deprecated (Thiago A. Corr?a)
>   7. Re: [git commit master] u-boot: mark old 2008.10 version as
>      deprecated (Hans-Christian Egtvedt)
>   8. SDL_net target name (Julien Boibessot)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Thu, 27 Aug 2009 08:12:53 -0700
> From: Dan Pattison <dan.pattison@ethertek.ca>
> Subject: [Buildroot] Linux Kernel 2.6.30 for ARM
> To: buildroot at busybox.net
> Message-ID: <4A96A275.5090909@ethertek.ca>
> Content-Type: text/plain; charset=ISO-8859-1; format=flowed
>
> Hello Build Root Maintainers,
>
> Will ULF's git tree make it into the newest buildroot release? I would
> like to take kernel 2.6.30 for a spin.
>
> Best Regards,
> Dan Pattison
>
>
>
> ------------------------------
>
> Message: 2
> Date: Thu, 27 Aug 2009 17:29:20 +0200
> From: Peter Korsgaard <jacmet@uclibc.org>
> Subject: Re: [Buildroot] Linux Kernel 2.6.30 for ARM
> To: Dan Pattison <dan.pattison@ethertek.ca>
> Cc: buildroot at busybox.net
> Message-ID: <87iqg9ff73.fsf@macbook.be.48ers.dk>
> Content-Type: text/plain; charset=us-ascii
>
>>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:
>
> Dan> Hello Build Root Maintainers,
> Dan> Will ULF's git tree make it into the newest buildroot release? I 
> would
> Dan> like to take kernel 2.6.30 for a spin.
>
> I haven't seen any pull requests from Ulf, and as the 2009.08 release is
> scheduled for this coming weekend I strongly doubt it.
>
> Ulf?
>
> -- 
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 3
> Date: Thu, 27 Aug 2009 15:56:00 +0000 (UTC)
> From: bugzilla at busybox.net
> Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
> To: buildroot at uclibc.org
> Message-ID: <20090827155600.B2E0477714@busybox.osuosl.org>
> Content-Type: text/plain; charset="UTF-8"
>
> https://bugs.busybox.net/show_bug.cgi?id=527
>
>
>
>
>
> --- Comment #13 from Daniele Salvatore Albano <d.albano@gmail.com> 
> 2009-08-27 15:55:59 UTC ---
> Sorry for the long delay, but i got some troubles with my git copy and 
> being
> full of work i didn't have the time to fix. I just dropping all the stuff
> making a copy of my old tree and reappling patches.
>
> I hope to send patches for this evening
>
>
> -- 
> Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You are on the CC list for the bug.
>
>
> ------------------------------
>
> Message: 4
> Date: Thu, 27 Aug 2009 15:52:50 -0400
> From: "Jonathan dumaresq" <jdumaresq@cimeq.qc.ca>
> Subject: Re: [Buildroot] gmp error with git version
> To: "'Will Newton'" <will.newton@gmail.com>
> Cc: buildroot at busybox.net
> Message-ID:
> <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAB0Y7MSDkjxEoVnp0qxmIdgBAAAAAA==@cimeq.qc.ca>
>
> Content-Type: text/plain; charset="iso-8859-1"
>
> Hi,
>
> Yeah I had a space in my path.
>
> Thanx for your help !
>
> Regards
>
> Jonathan
>
> -----Message d'origine-----
> De?: Will Newton [mailto:will.newton at gmail.com]
> Envoy??: 27 ao?t 2009 11:08
> ??: Jonathan Dumaresq
> Cc?: buildroot at busybox.net
> Objet?: Re: [Buildroot] gmp error with git version
>
> On Thu, Aug 27, 2009 at 3:51 PM, Jonathan Dumaresq<jdumaresq@cimeq.qc.ca>
> wrote:
>> Hi all,
>>
>> I'm trying the git version of buildroot for my atngw100 and I got this
>> error.
>>
>> I did
>>
>> make atngw100_defconfig
>> make
>>
>>
>> bzcat /home/dumarjo/projects/buildroot/dl/gmp-4.2.4.tar.bz2 | tar -C
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32 ? -xf -
>> toolchain/patch-kernel.sh
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4
>> package/gmp/ \*.patch
>> cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4
>> touch
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4/.unpacked
>> mkdir -p
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4-host
>> (cd 
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4-host;
>> rm -rf config.cache; \
>>
>>
> PATH=/home/dumarjo/projects/buildroot/build_avr32/host_dir/bin:/home/dumarjo
> /projects/buildroot/build_avr32/host_dir/usr/bin:/home/dumarjo/projects/C2T3
> /buildroot-avr32-v2.3.0-1/buildroot-avr32-v2.3.0/build_avr32/staging_dir/usr
> /bin:
>> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
>> AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld
>> -L/home/dumarjo/projects/buildroot/build_avr32/host_dir/lib
>> -L/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/lib"
>> NM="/usr/bin/nm" CC="/usr/bin/gcc
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
>> GCC="/usr/bin/gcc
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
>> CXX="/usr/bin/g++
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
>> CPP="/usr/bin/cpp
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
>> AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
>> CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
>> CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
>> FC_FOR_BUILD="/usr/bin/ld"
>>
> CFLAGS_FOR_BUILD="-I/home/dumarjo/projects/buildroot/build_avr32/host_dir/in
> clude
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
>>
> CXXFLAGS_FOR_BUILD="-I/home/dumarjo/projects/buildroot/build_avr32/host_dir/
> include
>> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
>>
> LDFLAGS_FOR_BUILD="-L/home/dumarjo/projects/buildroot/build_avr32/host_dir/l
> ib
>> -L/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/lib"
>> FCFLAGS_FOR_BUILD=""
>>
> AR_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/
> bin/avr32-linux-uclibc-ar"
>>
> AS_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/
> bin/avr32-linux-uclibc-as"
>>
> CC_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/
> bin/avr32-linux-uclibc-gcc"
>>
> LD_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/
> bin/avr32-linux-uclibc-ld"
>>
> NM_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/
> bin/avr32-linux-uclibc-nm"
>>
> RANLIB_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/
> usr/bin/avr32-linux-uclibc-ranlib"
>>
> STRIP_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/u
> sr/bin/avr32-linux-uclibc-strip"
>>
> OBJCOPY_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir
> /usr/bin/avr32-linux-uclibc-objcopy"
>>
> OBJDUMP_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir
> /usr/bin/avr32-linux-uclibc-objdump"
>>
> DEFAULT_ASSEMBLER="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/
> usr/bin/avr32-linux-uclibc-as"
>>
> DEFAULT_LINKER="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr
> /bin/avr32-linux-uclibc-ld"
>>
> ORIGINAL_AS_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging
> _dir/usr/bin/avr32-linux-uclibc-as"
>>
> ORIGINAL_LD_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging
> _dir/usr/bin/avr32-linux-uclibc-ld"
>>
> ORIGINAL_NM_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging
> _dir/usr/bin/avr32-linux-uclibc-nm"
>>
> ORIGINAL_OBJDUMP_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/st
> aging_dir/usr/bin/avr32-linux-uclibc-objdump"
>>
> PKG_CONFIG="/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/bin/pk
> g-config"
>>
> PKG_CONFIG_PATH="/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/l
> ib/pkgconfig"
>> \
>> ? ? ? ? ? ? ? ?\
>>
>> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4/configure
> \
>>
>> --prefix="/home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp" \
>> ? ? ? ? ? ? ? --build=i386-pc-linux-gnu \
>> ? ? ? ? ? ? ? --host=i386-pc-linux-gnu \
>> ? ? ? ? ? ? ? --disable-shared \
>> ? ? ? ? ? ? ? --enable-static \
>> ? ? ? ? ? ? ? ?\
>> ? ? ? )
>> /bin/bash: line 1:
>> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
> No
>> such file or directory
>> make: ***
>>
> [/home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4-host/.conf
> igured]
>> Error 127
>>
>> I could not what file is missing.
>
> It looks like you have a space at the start of your PATH environment
> variable that is causing the shell to parse part of PATH as an
> executable name.
>
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
>
>
> ------------------------------
>
> Message: 5
> Date: Thu, 27 Aug 2009 17:29:52 -0400
> From: Bill Bogstad <bogstad@pobox.com>
> Subject: [Buildroot] Does the kexec package buildroot-2009.05 for
> i386?
> To: buildroot at busybox.net
> Message-ID:
> <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> When I try to use buildroot to to generate a minimal init ramdisk for
> i386, I get the following error if I try include the kexec package:
>
> ......
> bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
> /bin/sh: bin/bin-to-hex: not found
> make[1]: *** [kexec/purgatory.c] Error 127
> make[1]: Leaving directory
> `/home/bogstad/software/buildroot/buildroot-2009.05/build_i386/kexec-2.0.0'
> make: *** 
> [/home/bogstad/software/buildroot/buildroot-2009.05/build_i386/kexec-2.0.0/.stamp_built]
> Error
>
> Does kexec build for any architecture in 2009.05?  Any suggestions on
> making this work for i386?
>
> Thanks,
> Bill Bogstad
>
>
> ------------------------------
>
> Message: 6
> Date: Thu, 27 Aug 2009 22:38:25 -0300
> From: Thiago A. Corr?a <thiago.correa@gmail.com>
> Subject: Re: [Buildroot] [git commit master] u-boot: mark old 2008.10
> version as deprecated
> To: Peter Korsgaard <jacmet@sunsite.dk>
> Cc: buildroot at busybox.net
> Message-ID:
> <d6cda7730908271838qc80efdfj259e9bf1609f396e@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hi,
>
>   Someone should test if newer u-boot works properly before doing
> that. This was the last known version to work with AVR32, and if I
> remember it correctly, the problem wasn't platform specific but
> something to do with the flash drivers or something. Sorry, can't be
> more specific, I have a very short memory.
>
> Kind Regards,
>   Thiago A. Correa
>
>
> ------------------------------
>
> Message: 7
> Date: Fri, 28 Aug 2009 07:23:54 +0200
> From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
> Subject: Re: [Buildroot] [git commit master] u-boot: mark old 2008.10
> version as deprecated
> To: "Thiago A. Corr?a " <thiago.correa@gmail.com>
> Cc: buildroot at busybox.net, Peter Korsgaard <jacmet@sunsite.dk>
> Message-ID: <20090828072354.38044247@hcegtvedt.norway.atmel.com>
> Content-Type: text/plain; charset=UTF-8
>
> On Thu, 27 Aug 2009 22:38:25 -0300
> Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
>
>> Hi,
>>
>>    Someone should test if newer u-boot works properly before doing
>> that. This was the last known version to work with AVR32, and if I
>> remember it correctly, the problem wasn't platform specific but
>> something to do with the flash drivers or something. Sorry, can't be
>> more specific, I have a very short memory.
>>
>
> You're right, AVR32 triggered something in the generic flash stuff.
>
> And it is still not fixed...
>
> U-Boot> saveenv
> Saving Environment to Flash...
> Error: start and/or end address not on sector boundary
>
> I'll need to prod around for that.
>
> -- 
> Best regards,
> Hans-Christian Egtvedt
>
>
> ------------------------------
>
> Message: 8
> Date: Fri, 28 Aug 2009 10:17:17 +0200
> From: Julien Boibessot <julien.boibessot@free.fr>
> Subject: [Buildroot] SDL_net target name
> To: buildroot at busybox.net
> Message-ID: <4A97928D.6070702@free.fr>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hi,
>
> Makefile target name to build SDL_net is "SDL_net" whereas all other
> SDL_xx extensions are "sdl_xx" (example: make sdl_image, make sdl_ttf,
> etc...).
> Moreover it seems that most other BR target are in lowercase.
>
> Is there any reason why SDL_net target should be an uppercase/lowercase
> mix ?
> Can you correct that for the coming release ? (I will soon propose
> patches that depend on sdl_xx and I don't want to add to some more
> "SDL_net" if it's not correct )
>
> Regards,
> Julien
>
>
> ------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
> End of buildroot Digest, Vol 38, Issue 69
> ***************************************** 
