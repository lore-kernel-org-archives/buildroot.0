From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 10:26:02 +0100
Subject: [Buildroot] [PATCH] pdbg: Bump version to v3.1
In-Reply-To: <20201027030306.488110-1-joel@jms.id.au>
References: <20201027030306.488110-1-joel@jms.id.au>
Message-ID: <20201027102602.203b3634@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 13:33:06 +1030
Joel Stanley <joel@jms.id.au> wrote:

> The uclibc build fix from v3.0 has since been merged.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../pdbg/0001-Fix-building-with-uclibc.patch  | 32 -------------------
>  package/pdbg/pdbg.hash                        |  2 +-
>  package/pdbg/pdbg.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/pdbg/0001-Fix-building-with-uclibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
