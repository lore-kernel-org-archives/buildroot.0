From: Joe tech <joetech20@gmail.com>
Date: Mon, 14 Sep 2009 12:59:07 +0530
Subject: [Buildroot] [buildroot 0003714]: oprofile doesn't build because bfd
Message-ID: <4345ac050909140029h6e592d9blb9d4c72fbdc1fbcd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I face the same issue as reported here, ?oprofile doesn't build
because bfd library not found?. I could not find the mentioned patch.
Is there a way to access the patch or any known fix for this issue? I
understand the issue is because, binutils are not generating .so
files. I am using buildroot-2009.08 (as downloaded from busy box url,
including the same version of gcc, uclibc ,busybox etc ) with 2.6.28
Linux kernel.

It would be great if someone can extend me a helping hand here at the earliest.

Regards,
Joe
