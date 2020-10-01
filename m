From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Oct 2020 10:58:26 +0200
Subject: [Buildroot] [PATCH] package/gcc: drop leftovers from PowerPC
 conditional patching
In-Reply-To: <20200924102219.3443175-1-thomas.petazzoni@bootlin.com>
References: <20200924102219.3443175-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201001105826.0ed0bb8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Sep 2020 12:22:18 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> We used to have a conditional patch applied on PowerPC soft-float, but
> this logic was dropped in commit
> 0c82f3f63563c4d4d7e034d0e9e4ceb766d92322 ("package/gcc: remove powerpc
> conditional patching logic"). However, we still have some related
> leftovers in the calculation of the hashes for ccache, which can now
> be dropped.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/gcc/gcc.mk | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
