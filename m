From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Mar 2012 16:58:38 +0100
Subject: [Buildroot] [PATCH] elf2flt: fix after conversion of binutils
 to package infrastructure
In-Reply-To: <1332084958-1085-1-git-send-email-arnout@mind.be>
References: <CAFm-AyppuS3y-oHUHj_Xz1u+JB2qLDKmHVF4MQV-8=8u9cwwEw@mail.gmail.com>
 <1332084958-1085-1-git-send-email-arnout@mind.be>
Message-ID: <20120318165838.7596efeb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 18 Mar 2012 16:35:58 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Probably it should be converted to autotargets as well.  However, I
> don't know how to test if the resulting tool still works.

I have started setting up an environment for a noMMU ARM kernel and
userspace that runs under the SkyEye emulator. I intend to clean this
up and make it available as a defconfig so that we have at least one
noMMU environment we can use for testing.

So far I have something that boots into a Busybox userspace, but it is
built with the Soucery CodeBench uClinux toolchain. I think I will
clean it up as is, we can see later if the internal toolchain backend
works to build a correct toolchain for this usecase.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
