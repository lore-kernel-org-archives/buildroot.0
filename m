From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:20:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/postgresql: add configure and
 includedir-server output to pg_config
In-Reply-To: <20201005101951.3112095-2-fido_max@inbox.ru>
References: <20201005101951.3112095-1-fido_max@inbox.ru>
 <20201005101951.3112095-2-fido_max@inbox.ru>
Message-ID: <20201008232017.6dde8d18@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 13:19:50 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Some external packages call pg_config to determine the installed PostgreSQL
> version. Add this output to Buildroots own pg_config, so these packages
> correctly compile.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/pg_config     | 8 +++++++-
>  package/postgresql/postgresql.mk | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
