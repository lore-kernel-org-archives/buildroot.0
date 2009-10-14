From: Francisco Gonzalez <gzmorell@gmail.com>
Date: Wed, 14 Oct 2009 11:28:31 +0200
Subject: [Buildroot] Makedevs
Message-ID: <fffd86390910140228u2bc5ee26nc4982ccbb34b1405@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the process of building an ARM target which I test with NFS mount, I
have noticed thatin the "rooot/dev" there is only normal files.
I have built the nodes using mknod. But I have noticed the
"/makedevs-host/makedevs" application.
Should it run during a normal "make"? or we must run it as root after a
"make"?

regards,
Francisco
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091014/3446c025/attachment.htm>
