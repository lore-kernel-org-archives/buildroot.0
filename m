From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 20:01:58 +0200
Subject: [Buildroot] [PATCH 01/13] configs/freescale_p1010rdb_pa: remove
	U-Boot build
In-Reply-To: <20161015145107.18264-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 15 Oct 2016 16:50:55 +0200")
References: <20161015145107.18264-1-arnout@mind.be>
 <20161015145107.18264-2-arnout@mind.be>
Message-ID: <874m4da3u1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Binutils was locked down to 2.24 because U-Boot 2014.01 didn't build
 > with more recent binutils. However, this doesn't work anymore because
 > binutils 2.24 is deprecated.

 > Current U-Boot 2016.09.01 does build successfully, but we don't have a
 > board anymore to test it.

 > Since updating U-Boot is generally not needed anyway, we just remove
 > the U-Boot support.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
