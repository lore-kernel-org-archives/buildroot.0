From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:21:34 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: bump kernel version
In-Reply-To: <1399058994-15218-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 2 May 2014 21:29:54 +0200")
References: <1399058994-15218-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87a9ayoegx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Upstream has been playing evil-rebase on their tree, so they now
 > no longer have the changeset we are currently referencing.

 > They have now agreed to merge instead of rebasing:
 >     https://github.com/raspberrypi/linux/issues/584

 > So, update the raspberrypi_defconfig to use a new changeset that
 > currently exists right _now_, in the hope it will not disapear in
 > the future (but we'll catch it pretty fast anyway, so we'll be able
 > to seriously bug up upstream in that case ;-) ).

 > Reported-by: Jeremy Rosen <jeremy.rosen@openwide.fr>
 > Signed-off-by: yann.morin.1998 at free.fr
 > Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
