From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Sat, 14 Jul 2007 17:41:04 +0700
Subject: [Buildroot] Patch to upgrade dialog and make it compile
Message-ID: <5d75f4610707140341i1c92726epdd57d50f330b876d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attached is a patch against subversion version 19085 to upgrade the
version of dialog.  It also makes dialog build for me.  If the
configure --host option is set normally, then the configure script is
hard-coded to use /lib for any name with 'linux' in it, so to avoid
this problem I used the name without 'linux' in it.  This problem is
the same for the debian dialog version that was already in subversion
version 19085, so the upgrade is just to avoid having to patch and to
use the original (and newer) upstream source version.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dialog.patch
Type: text/x-diff
Size: 1679 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070714/d9ae1a95/attachment.bin 
