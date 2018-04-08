From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 21:43:47 +0200
Subject: [Buildroot] [git commit] postgresql: propagate BR2_USE_MMU
 dependency to Config.in comment
In-Reply-To: <20180405080430.D990084F90@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 5 Apr 2018 09:36:01 +0200")
References: <20180405080430.D990084F90@busybox.osuosl.org>
Message-ID: <87bmeta3gs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9fec3eb9131dba46cbf8474a7def05a076990079
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The BR2_PACKAGE_POSTGRESQL option depends on BR2_USE_MMU, so the
 > Config.in comment about the dynamic library dependency should only be
 > displayed if the BR2_USE_MMU requirement is met.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
