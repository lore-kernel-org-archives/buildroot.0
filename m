From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 15:02:00 +0200
Subject: [Buildroot] packages and architecture specific include files
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909B55F47@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Fri\,
	17 Oct 2008 18\:00\:10 -0400")
References: <014301c92ef4$75909f80$6901a8c0@iguana3>
	<BD79186B4FD85F4B8E60E381CAEE1909AEF664@mi8nycmail19.Mi8.com>
	<00db01c9309b$91456c80$6901a8c0@iguana3>
	<BD79186B4FD85F4B8E60E381CAEE1909B55F47@mi8nycmail19.Mi8.com>
Message-ID: <87d4hykqev.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> You probably have target/generic/target_busybox_skeleton
 hartleys> selected in your busybox config. The /sys directory is
 hartleys> missing in that skeleton.

That seems kinda broken as /etc/fstab has sysfs listed. Fixed in
r23711.

-- 
Bye, Peter Korsgaard
