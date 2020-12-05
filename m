From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:28:51 +0100
Subject: [Buildroot] [PATCH/next v1] package/hdparm: bump version to 9.60
In-Reply-To: <20201202182215.11411-1-ps.report@gmx.net>
References: <20201202182215.11411-1-ps.report@gmx.net>
Message-ID: <20201205212851.1f5fdf03@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Dec 2020 19:22:15 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Changes according to [1] and [2]:
> 
> - decode more bits from id[69], courtesy Adri?n K?lazi.
> - allow passing of custom LDFLAGS from the environment.
> - add new "static" target.
> - fix --dco-identify max sectors, courtesy of Paul Sultana.
> - get rid of leftover "unknown" variables from identify.c
> - fixed return values from get_log_page_data().
> - support for ioSafe Solo with jMicron bridge.
> 
> [1] https://sourceforge.net/p/hdparm/news/2020/11/hdparm-959-is-released
> [2] https://sourceforge.net/p/hdparm/news/2020/11/hdparm-960-is-released
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/hdparm/hdparm.hash | 8 ++++----
>  package/hdparm/hdparm.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
