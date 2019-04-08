From: =?UTF-8?B?0KHQtdGA0LPQtdC5INCh0LDRhdC90L4=?= <sergei.sakhno@gmail.com>
Date: Mon, 8 Apr 2019 19:00:44 +0300
Subject: [Buildroot] Failed host-flex build after merge with nightly
 buildroot
Message-ID: <CAOqJNTf0u4_YTsVMuKT0pkSDU3jDWmLh3=JbJPY4O7kge02qmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use master of buildroot for develop linux image, and periodical merge my
system with last master. After last merge, build host-flex failsed with
error:

>>> host-flex 2.6.4 Configuring
buildroot_1  | >>> host-flex 2.6.4 Gettextizing
buildroot_1  | /bin/bash: -c: line 1: syntax error: unexpected end of file
buildroot_1  | make: ***
[/ntc_image/standard/output/build/host-flex-2.6.4/.stamp_configured] Error 1
buildroot_1  | package/pkg-generic.mk:228: recipe for target
'/ntc_image/standard/output/build/host-flex-2.6.4/.stamp_configured' failed

How i can find source of this error?

Regards,
Sakhno Serhii
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190408/ad4fb7bb/attachment.html>
