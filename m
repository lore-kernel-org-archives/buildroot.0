From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Jul 2010 12:50:54 -0300
Subject: [Buildroot] [PATCH] Migrate iostat to gentargets
Message-ID: <4C4868DE.1080805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Migrate iostat to gentargets.
Also make the cpu counting routine more reliable (for ARM it's
"Processor" in cpuinfo rather than "processor").
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-iostat-gentargets.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100722/b46af356/attachment.ksh>
