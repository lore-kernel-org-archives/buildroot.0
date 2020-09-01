From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 20:42:49 +0200
Subject: [Buildroot] [git commit] package/pkg-kconfig: quote
 HOSTCC_NOCCACHE
In-Reply-To: <20200830163025.49A1A819A4@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 30 Aug 2020 18:33:39 +0200")
References: <20200830163025.49A1A819A4@busybox.osuosl.org>
Message-ID: <871rjl9w46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=94bb89ad578cbab1624af6492b25b74130500c29
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > HOSTCC may contain spaces, so needs to be quoted.

 > Most of the places where it is already quoted use double-quotes, so we
 > use that.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
