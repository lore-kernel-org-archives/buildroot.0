From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:56:34 +0100
Subject: [Buildroot] [PATCH] package/postgresql: add full build option
In-Reply-To: <20210125113613.865987-2-fido_max@inbox.ru>
References: <20210125113613.865987-1-fido_max@inbox.ru>
 <20210125113613.865987-2-fido_max@inbox.ru>
Message-ID: <20210125215634.2883c22e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 14:36:13 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Postgresql includes some extra additional loadable modules.
> We need just to pass "world/install-world" as make/install targets
> to build this modules.
> 
> As a side effect documentation will also be built by "make world".
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/Config.in     | 9 +++++++++
>  package/postgresql/postgresql.mk | 6 ++++++
>  2 files changed, 15 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
