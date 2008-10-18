From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 14:48:17 +0200
Subject: [Buildroot] Atmel file system skeleton missing /sys directory
In-Reply-To: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl> (John Schimandle's
	message of "Fri\, 17 Oct 2008 17\:07\:51 -0700")
References: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
Message-ID: <87bpxim5m6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Schimandle <john_schimandle@hotmail.com> writes:

Hi,

 John> I'm still working through my issues with programming on the
 John> at91sam9263ek board and discovered a bug in the Atmel root file
 John> system skeleton directory. The root file system was missing the
 John> /sys directory and that caused sysfs to not mount at boot
 John> time. I manually added the sys directory to
 John> target/device/Atmel/ root/target_skeleton. removed the
 John> target_build_arm/at91sam9263ek/.root file, rebuilt buildroot
 John> and that fixed the problem.
 
 John> I would like to propogate the patch into the buildroot system
 John> but I don't know the appropriate place to fix the problem.

Like this ;) Fixed in r23708.

-- 
Bye, Peter Korsgaard
