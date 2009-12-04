From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Dec 2009 12:44:51 +0100
Subject: [Buildroot] Small building issue busybox-1.14.4 with linux
	kernel 2.6.32
In-Reply-To: <92a1e6ea0912040304q7c79b418t2a5972ae0a4502d5@mail.gmail.com>
	(Emmanuel Blot's message of "Fri, 4 Dec 2009 12:04:46 +0100")
References: <92a1e6ea0912040304q7c79b418t2a5972ae0a4502d5@mail.gmail.com>
Message-ID: <87638nrmj0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Emmanuel" == Emmanuel Blot <eblot.ml@gmail.com> writes:

 Emmanuel> Hi all,
 Emmanuel> I'm not sure if it's a real bug or if I did something wrong, but
 Emmanuel> busybox fails to build with the latest linux kernel, because of a
 Emmanuel> missing type definition:
 Emmanuel> (from git buildroot repository)

Ahh yes, we need a fix like
linux-2.6.31.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
for 2.6.32 as well - Will fix.

-- 
Bye, Peter Korsgaard
