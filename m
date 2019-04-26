From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:42:20 +0200
Subject: [Buildroot] [git commit] package/yaffs2utils: create
 $(HOST_DIR)/bin before installation
In-Reply-To: <20190421102949.10D9B81441@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 21 Apr 2019 12:32:23 +0200")
References: <20190421102949.10D9B81441@busybox.osuosl.org>
Message-ID: <87a7gd0wgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=01a0bd3f739ce1284a89641b7f41705c57b5bd04
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The yaffs2utils Makefile uses plain "cp", which fails when
 > $(HOST_DIR)/bin doesn't exist. Fix that by creationg $(HOST_DIR)/bin
 > beforehand.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339624

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
