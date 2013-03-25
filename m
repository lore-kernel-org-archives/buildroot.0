From: =?UTF-8?B?VGlsbWFuIEtlc2tpbsO2eg==?= <arved@arved.at>
Date: Mon, 25 Mar 2013 12:14:28 +0100
Subject: [Buildroot] Fix copying of dotfiles in /
Message-ID: <51503194.2090101@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An Example is /.init_enable_core to enable coredumps



thanks to Snaps@#buildroot for the idea of solving this with rsync.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch-copy-dotfiles.diff
Type: text/x-patch
Size: 450 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130325/1918e76e/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130325/1918e76e/attachment.asc>
