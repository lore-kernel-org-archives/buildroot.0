From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Fri, 6 Jul 2007 11:41:30 +0700
Subject: [Buildroot] patch for file package
Message-ID: <5d75f4610707052141s1bdcee26r980881e518b23ae9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attached is a patch for the file package for subversion version 19006
that creates a missing directory so that packages after file can build.
File was creating a file for the 'include' instead of a file inside of the
include because it didn't have the mkdir -p
-------------- next part --------------
A non-text attachment was scrubbed...
Name: file.patch
Type: application/octet-stream
Size: 462 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070706/a5371f2a/attachment.obj 
