From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 06 Feb 2012 22:32:40 +0100
Subject: [Buildroot] [PATCH] New package: gpio9260
In-Reply-To: <1450339669-1328562959-cardhu_decombobulator_blackberry.rim.net-667609737-@b26.c30.bise6.blackberry>
 (J. C. Woltz's message of "Mon, 6 Feb 2012 21:16:02 +0000")
References: <1450339669-1328562959-cardhu_decombobulator_blackberry.rim.net-667609737-@b26.c30.bise6.blackberry>
Message-ID: <871uq7ve9z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J" == J C Woltz <jwoltz@gmail.com> writes:

Hi,

 J> I cannot answer what the advantage is. This is just a first patch of
 J> many to support full functionality of the Synapse Wireless E10. They
 J> and calao use gpio9260 for simple user access from shell script.
 J> Primarily for reading push buttons.

So you are not the author of the software? Where did you get it from?

 J> I don't care if this is accepted. It would be nice, but not needed. 

 J> I have patches for the following:
 J> -updated usb_modswitch
 J> -add usb_modeswitch_data package

 J> -board support for the E10 including linux patch, u-boot patch, and
 J> linux config, and buildroot e10_defconfig

What is this e10? Is the Linux/U-boot patches submitted upstream?

 J> Since I am new to submitting patches to buildroot, I would
 J> appreciate any advice/etiquette you have for me to submit the
 J> patches.

My first advice is that you should keep discussion on the mailing list,
don't just mail me directly, thanks.

-- 
Bye, Peter Korsgaard
