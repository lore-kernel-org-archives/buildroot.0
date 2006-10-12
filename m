From: Will Newton <will.newton@gmail.com>
Date: Thu, 12 Oct 2006 10:38:23 +0100
Subject: [Buildroot] Order of mounts in inittab
Message-ID: <87a5b0800610120238l480df3c4lfefd6133afe981c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed that since upgrading to busybox 1.2.1 that I had to reorder
the mount lines in inittab so proc was mounted before remounting / as
rw took place or I would get "could not open /proc/mounts" and the
remount would fail. Does anyone know why this might be?

Patch attached.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: inittab.patch
Type: application/octet-stream
Size: 504 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061012/082502ef/attachment.obj 
