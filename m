From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 10 Mar 2008 19:43:57 +0000
Subject: [Buildroot] $(ARCH) not set & mirrors
Message-ID: <1205178237.10692.178.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

1. As reported by another gentleman earlier this month, I'm having the
same issue with $(ARCH) not being set for the default build options
freshly checked out from svn. Where can I look to debug this?

2. I've found quite a number of make files which don't use the mirror's
defined in menu config to retrieve the sources ... can I submit patches
to fix this or is it intentional?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080310/19e9ff7d/attachment.pgp 
