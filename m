From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Tue, 3 Mar 2009 17:46:18 -0800
Subject: [Buildroot] [PATCH] mDNSresponder cross-compilation
Message-ID: <206b9e70903031746n64eb2b82n459ca3092b12f6a1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the mdnsresponder package from Apple so that it will
cross-compile on arm. It also fixes an incorrect usage of $(PKG)_SITE.

It is against the 2009.02 release.

Please let me know if this format does not work well and I will resubmit.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mdnsresponder-cross-compile.patch
Type: text/x-diff
Size: 2974 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090303/85e20148/attachment.bin>
