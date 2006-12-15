From: Robin Mordasiewicz <rmordasiewicz@samuelmanutech.com>
Date: Fri, 15 Dec 2006 15:14:34 -0500 (EST)
Subject: [Buildroot] kernel compile problem
Message-ID: <Pine.LNX.4.64.0612151513000.9011@smtcorms05.samuelmanutech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using the snapshot from yesterday

I had two failures

1. the version of file which the make file looks for is not available on 
that ftp site. I uipdated it to 4.19

2. I had to apply this kernel patch
http://www.kernel.org/pub/linux/devel/binutils/linux-2.6-seg-5.patch

-- 
