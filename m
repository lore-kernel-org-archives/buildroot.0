From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:56:30 +0100
Subject: [Buildroot] [PATCH] package/postgresql: add some additional
 output to pg_config
In-Reply-To: <20210125113613.865987-1-fido_max@inbox.ru>
References: <20210125113613.865987-1-fido_max@inbox.ru>
Message-ID: <20210125215630.36d68a72@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 14:36:12 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> Some external packages call pg_config to determine the installed
> PostgreSQL options. Add this output to Buildroots own pg_config,
> so these packages correctly compile.
> 
> Added options:
> 	--pkgincludedir
> 	--pgxs
> 	--cflags
> 	--cc
> 	--pkglibdir
> 	--bindir
> 	--sharedir
> 	--localedir
> 	--docdir
> 	--mandir
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/pg_config     | 51 ++++++++++++++++++++++++++++++--
>  package/postgresql/postgresql.mk |  2 ++
>  2 files changed, 51 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
