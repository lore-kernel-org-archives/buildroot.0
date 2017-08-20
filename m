From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Aug 2017 10:06:33 +0200
Subject: [Buildroot] [PATCH 3/3] kvmtool: add patches fixing build
	warnings	with musl
References: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
 <20170819205528.31753-3-thomas.petazzoni@free-electrons.com>
Message-ID: <9hsn6ex8gp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 19 Aug 2017 22:55:28 +0200 schrieb Thomas Petazzoni:

> This commit backports three patches that are already upstream in kvmtool
> fixing build warnings with musl. Those are not strictly needed for the
> build to succeed, they just reduce the amount of warning noise.
> 
> Signed-off-by: Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ build-tested using http://autobuild.buildroot.net/results/ae4/
ae434d85be12d07dddf4c955855120da83a19dd6/defconfig ]
