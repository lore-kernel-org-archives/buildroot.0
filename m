From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 15:03:59 +0200
Subject: [Buildroot] [PATCH] New package: acl
In-Reply-To: <4E1D61D7.1080704@visionsystems.de> (Yegor Yefremov's message of
 "Wed, 13 Jul 2011 11:13:59 +0200")
References: <4E1D61D7.1080704@visionsystems.de>
Message-ID: <87wrfme3i8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> POSIX Access Control Lists, which are used to define more
 Yegor> fine-grained discretionary access rights for files and
 Yegor> directories.

It needs largefile support in the toolchain, otherwise it looks good.

Committed with that change - Thanks everyone.

-- 
Bye, Peter Korsgaard
