From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 20:02:06 +0200
Subject: [Buildroot] [PATCH 02/13] configs/freescale_mpc8315erdb: remove
	U-Boot build
In-Reply-To: <20161015145107.18264-3-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 15 Oct 2016 16:50:56 +0200")
References: <20161015145107.18264-1-arnout@mind.be>
 <20161015145107.18264-3-arnout@mind.be>
Message-ID: <87zim58p9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Binutils was locked down to 2.24 because U-Boot 2014.01 didn't build
 > with more recent binutils. However, this doesn't work anymore because
 > binutils 2.24 is deprecated.

 > Current U-Boot 2016.09.01 doesn't work out of the box because the
 > u-boot-nand.img support has been removed.

 > Since updating U-Boot is generally not needed anyway, we just remove
 > the U-Boot support.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 > Gustavo still has this board to test again, so when he has time, he
 > will try to revive with current U-Boot.

Committed, thanks.

-- 
Bye, Peter Korsgaard
