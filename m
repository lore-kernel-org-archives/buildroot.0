From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Dec 2009 15:38:29 +0100
Subject: [Buildroot] Creating user accounts in rootfs
In-Reply-To: <4B053FEB.20104@free.fr> (Julien Boibessot's message of "Thu, 19
	Nov 2009 13:54:03 +0100")
References: <4B053FEB.20104@free.fr>
Message-ID: <87skbivqqi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

Hi,

 Julien> Does someone know a better way than the following to create user
 Julien> accounts ? :
 Julien> * on the target use "adduser xxx"
 Julien> * then copy target's "/etc/passwd" and "/etc/shadow" to Host's
 Julien> "buildroot/target/..../rootfs/target_skeleton/..."
 Julien> * rebuild rootfs

 Julien> My goal is to have a rootfs with preset user accounts, ready to
 Julien> be used as soon as the rootfs image has been flashed.

No, that's certainly the easiest solution (and how I normally do it).

-- 
Bye, Peter Korsgaard
