From: Ulrich Hecht <uli@suse.de>
Date: Thu, 14 Dec 2006 15:46:40 +0100
Subject: [Buildroot] [patch] avoid redownloading locale tarball
Message-ID: <200612141546.41143.uli@suse.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This patch downloads uClibc-locale-030818.tgz to dl and copies it from 
there instead of downloading it again for every uClibc build.

CU
Uli
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc-locale.patch
Type: text/x-diff
Size: 1246 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061214/cf25b157/attachment-0001.bin 
