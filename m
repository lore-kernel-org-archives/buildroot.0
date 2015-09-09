From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 9 Sep 2015 16:05:07 +0100
Subject: [Buildroot] autobuild fixes
Message-ID: <CA+BsyQ6N55Jwyk3JV3J2co0GccTYk8r_smp_Qug-zhRoT7oZTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Do you (or one of the other committers) expect to have a chance to
commit some of the outstanding autobuild fixes ? Quite a few have been
submitted in over the past few days.

Also - can you look at bumping the autobuilder's musl release ? They
recently went to version 1.11 and this fixes a problem where syncfs()
incorrectly returned void instead of int (which causes coreutils to
fail).

regards

Brendan
