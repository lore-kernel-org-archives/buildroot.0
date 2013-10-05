From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Oct 2013 11:12:41 +0200
Subject: [Buildroot] [PATCHv2] beaglebone: add BeagleBone Black support
In-Reply-To: <4620256.4JgqIslJcA@asici> ("Fatih =?utf-8?B?QcWfxLFjxLEiJ3M=?=
 message of "Sat, 05 Oct 2013 10:53:33 +0300")
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <A20C6CC8-715F-45C3-BB9F-5085269FFD13@ti.com>
 <878uy9jb7r.fsf@dell.be.48ers.dk> <4620256.4JgqIslJcA@asici>
Message-ID: <87mwmohyie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

Hi,

 >> I would like to keep it with ext2 just to keep it similar to the other
 >> defconfigs. Then we also don't need to carry the u-boot patch.

 Fatih> A patch is still needed since the default am335x_evm (also
 Fatih> omap[45]) config changes "bootdir" to "/boot" unlike the other
 Fatih> u-boot configs. I don't have an idea about the other options;
 Fatih> but at least this change is needed for a familiar experience
 Fatih> with other boards.

So it looks for uImage and .dtb files in rootfs:/boot? That sounds fine,
as that's where we're installing them.


-- 
Bye, Peter Korsgaard
