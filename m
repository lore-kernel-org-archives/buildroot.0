From: Massimiliano Marretta <max@marretta.com>
Date: Thu, 27 Feb 2014 09:22:05 +0100
Subject: [Buildroot] Qt5 and gpu-viv-bin-mx6q problem
Message-ID: <CACP2RPZb4V-hv61+eSq_pAaah8jmzXCFVr7hMN_jR=VzQDzFOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear,

I have some problem to obtain a buildroot with Qt5 and gpu-viv-bin-mx6q.
Where is the correct combination of toolchain and floating point strategy ?

I try some combination of toolchains with the last stable version of
buildroot (2013.11).

- If I use the last codebanch toolchain the gpu-viv-bin-mx6q examples and
the Qt5 qmlscene crash with segmentation fault.
- If I use the last buildroot linaro toolchain 4.8-2013.09, the system not
start because the kernel is to old ( 3.0.35 ).
- If I use the toolchain linaro-4.7-2013.01 the Qt5 qmlscene exit without
message and gpu-viv-bin-mx6q examples not start with the message program
not found.

Best Regards,
Massimiliano Marretta
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140227/291fdf61/attachment.html>
