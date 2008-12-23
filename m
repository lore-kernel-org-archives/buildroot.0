From: Hai Zaar <haizaar@codefidence.com>
Date: Tue, 23 Dec 2008 15:28:11 +0200
Subject: [Buildroot] switch to native u-boot for at91sam9260
Message-ID: <76d9e2a30812230528y2ac65c58hbdd2d86d35057c24@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day!
I've noticed that for at91sam9260 boards special version of u-boot is
used. However that u-boot version is outdated (1.2.0) and does not
work with nand. "Native" u-boot version 1.3.4 works just fine with
that board. So I'm proposing to enable native u-boot (the that sits
under target/u-boot) for that board.
Patch attached.

-- 
Zaar
www.codefidence.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: native-u_boot.patch
Type: text/x-diff
Size: 2136 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081223/36f3982c/attachment.bin 
