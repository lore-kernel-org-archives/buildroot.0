From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:12:38 +0200
Subject: [Buildroot] [PATCH] package/libnss: enable parallel building
In-Reply-To: <20200704221826.206342-1-giulio.benetti@benettiengineering.com>
References: <20200704221826.206342-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200705151238.358132d1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Jul 2020 00:18:26 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Enable parallel building by substituting $(MAKE1) with $(MAKE) in
> libnss.mk. Parallel Makefile building has been added after version 3.53
> so now it's time to enable it in Buildroot to save building time.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/libnss.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
