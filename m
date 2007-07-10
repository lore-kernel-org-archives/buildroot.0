From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Tue, 10 Jul 2007 15:08:36 +0700
Subject: [Buildroot] Patches to get lvm2 to build
Message-ID: <5d75f4610707100108h10ff2381je96aad395e9820ba@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

    Attached are patches to upgrade dm and lvm2 so they build.  The
old version of lvm2 would not build for me because it could not find
libdevmapper.h.  These patches also upgrade to the latest versions of
dm and lvm2.  This was tested with subversion version 19054.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dm.patch
Type: text/x-diff
Size: 1585 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070710/e06013b7/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: lvm2.patch
Type: text/x-diff
Size: 822 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070710/e06013b7/attachment-0001.bin 
