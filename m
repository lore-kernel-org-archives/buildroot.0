From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 23 Jan 2007 23:58:40 +0100
Subject: [Buildroot] [PATCH] Add local directory for non-public packages
Message-ID: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a "buildroot/local" directory.
The structure of "local" is the same as that of "packages"
but the contents of "local" is never
intended to be merged upstream.

It allows simple maintenance of those application
since you only need to move the local directory from
one version of buildroot to a newer.

Best Regards
Ulf Samuelsson



-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile_local.patch
Type: text/x-patch
Size: 1458 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070123/74be3a88/attachment-0001.bin 
