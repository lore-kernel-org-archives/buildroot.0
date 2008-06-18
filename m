From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 00:32:49 -0300
Subject: [Buildroot] [PATCH] Fix proftpd compile with recent kernels.
Message-ID: <d6cda7730806172032n7a564bc7g409d2bbe18c1d471@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ProFTPd fails to compile with kernels 2.6.24+

This patch bumps it to version 1.3.1 and applies a patch from gentoo
bugtracker #218850 (http://bugs.gentoo.org/show_bug.cgi?id=218850)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-proftpd-compile.patch
Type: application/octet-stream
Size: 2267 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080618/77cfaed7/attachment-0001.obj 
