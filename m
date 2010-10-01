From: Martin Banky <martin.banky@gmail.com>
Date: Thu, 30 Sep 2010 23:32:30 -0700
Subject: [Buildroot] [PATCH 0/3] change l2tp to xl2tp
Message-ID: <1285914753-22744-1-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure what format pppd.mk was in, I think it might have been an
intermediate version, but it wouldn't compile. I heavily reworked this package
so that it would compile correctly, there were several issues with CFLAGS that
had to be fixed.

l2tp is no longer available on debian's site, but there is a fork called xl2tp
that is currently being maintained.

Each patch is dependant on the previous patch.

[PATCH 1/3] libpcap: bump to 1.1.1
[PATCH 2/3] pppd: convert to gentargets
[PATCH 3/3] l2tp: convert to gentargets and change to xl2tp
