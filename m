From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 3 Jan 2008 22:57:41 -0200
Subject: [Buildroot] [PATCH] Change Samba download URL to the generic
	ftp.samba.org
Message-ID: <d6cda7730801031657r673649f6o85d29a18a897e3cc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes SAMPA_SITE to ftp://ftp.samba.org/pub/samba/stable
instead of ftp://us4.samba.org/pub/samba/.

As it's obvious, not everyone lives in the US. *smile*
It might be down, or it's just me, but from Brazil, I can't connect to
us4.samba.org. On the other hand, ftp.samba.org works just nicely.

Please apply.

Kind Regards,
   Thiago A. Correa
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-samba-download.patch
Type: text/x-patch
Size: 524 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080103/1ec7acc2/attachment.bin 
