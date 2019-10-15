From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2019 11:21:25 +0200
Subject: [Buildroot] [PATCH] package/openssh: bump to version 8.1p1
In-Reply-To: <8f10ad06dcd9d0e20abc06320d12911c595ba675.1571125538.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 15 Oct 2019 10:45:38 +0300")
References: <8f10ad06dcd9d0e20abc06320d12911c595ba675.1571125538.git.baruch@tkos.co.il>
Message-ID: <87v9sqxt2i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This bump is not marked as security bump. The 8.1 release fixes a XMSS
 > key parsing code vulnerability. This code can not be enabled without
 > explicit definition of the WITH_XMSS macro.

 > Update LICENCE hash; converted to UTF-8.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
