From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Mon, 02 Aug 2010 10:01:33 +0200
Subject: [Buildroot] kernel header patches
Message-ID: <4C567B5D.70600@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm working on different boards support to match our requirements.
Therefore I need to apply some patches to the kernel headers as well as
the kernel sources itself. Especially for header patches related to a
specific device I'm not sure how to enable them in the configuration.

In the Atmel device directory the variable KERNEL_HEADERS_PATCH_DIR will
be used to define a directory including some patches. But the 'ifeq'
check fails in 'kernel-headers-new.makefile'. In the previous version
(2010.05) it was possible to replace this check by a check on the shell.
But this will also fail with the new version (2010.08-rc1).

Is there an official way to apply patches to the kernel headers and
kernel sources depending on the board ?

Best regards

Patrick

-- 

Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:	+49 6332 914 526
Mail:	patrick.ziegler at fh-kl.de

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
