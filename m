From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Tue, 15 Mar 2016 12:19:17 +0000
Subject: [Buildroot] Regarding legal info in package
Message-ID: <90B0A5D74F9D1542B45328A4E51B57F0AA591713@PUMAIL01.pu.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am updating legal info in some packages. gnutls is licensed under LGPLv2.1+ but it depends on gmp package which has LGPLv3+ or GPLv2+ dual license. That means, gnutls needs to be distributed under LGPLv3+ or GPLv2+ dual license. And it's clearly mentioned in README file from package source tree.

quoting from README file:
LICENSING
---------
Since GnuTLS version 3.1.10, the core library has been released under
the GNU Lesser General Public License (LGPL) version 2.1 or later.

Note, however, that version 6.0.0 and later of the gmplib library used
by GnuTLS are distributed under a LGPLv3+ or GPLv2+ dual license, and
as such binaries of this library need to be distributed under either
LGPLv3+ or GPLv2+ license. If this is undesirable older versions
of the gmplib which are under LGPLv2.1 (e.g., version 4.2.1) may be
used instead. (gmplib versions between 4.2.2 through 5.1.3 were
licensed under LGPLv3+ only).

In this case, which license <PKG>_LICENSE variable should reflect ?
Should it be license under which package is released or license under which package needs to distributed because of licensing terms of dependent packages ?

Regards,
Rahul
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160315/cfe9ca9a/attachment.html>
