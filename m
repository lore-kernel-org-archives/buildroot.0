From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Wed, 18 Jul 2007 18:31:54 +0700
Subject: [Buildroot] hdparm
Message-ID: <5d75f4610707180431o54bab270s281655ab7d2d4063@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the hdparm package, it will install hdparm on top of the
buildroot symlink for hdparm which erases your buildroot (well, ok,
replaces buildroot so that every buildroot application is the real
hdparm).  Attached is a patch to first remove any existing hdparm
before installing the new one.
This is with buildroot subversion version 19152.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: hdparm.patch
Type: text/x-diff
Size: 551 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070718/787504bd/attachment.bin 
