From: daggs <daggs@gmx.com>
Date: Fri, 25 Nov 2016 21:34:55 +0100
Subject: [Buildroot] nfs timeout from buildroot's generated server
Message-ID: <trinity-ff4b8576-13c4-444b-a9f2-0319d60466dd-1480106095236@3capp-mailcom-bs07>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've built a small image with nfs-utils compiled.
the kernel is 3.14.79 based.
I've defined an export, defined version 4 and restarted the nfs.
running showmount -e <ip> from another box showed the mount but when I run this:
mount <ip>:/media /tmp/media or mount -t nfs4 <ip>:/media /tmp/media, I get this:
mount.nfs: Connection timed out or mount.nfs4: Connection timed out.
any ideas what might I'm doing wrong?
