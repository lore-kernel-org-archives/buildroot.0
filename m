From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 08:16:19 +0200
Subject: [Buildroot] [PATCH] package/gcc: drop leftovers from PowerPC
 conditional patching
In-Reply-To: <20200924102219.3443175-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 24 Sep 2020 12:22:18 +0200")
References: <20200924102219.3443175-1-thomas.petazzoni@bootlin.com>
Message-ID: <87pn5zzvf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > We used to have a conditional patch applied on PowerPC soft-float, but
 > this logic was dropped in commit
 > 0c82f3f63563c4d4d7e034d0e9e4ceb766d92322 ("package/gcc: remove powerpc
 > conditional patching logic"). However, we still have some related
 > leftovers in the calculation of the hashes for ccache, which can now
 > be dropped.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed to 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
