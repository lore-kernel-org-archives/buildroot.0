From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:48:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: use upstream systemd
 service files
In-Reply-To: <20210712043534.3849257-1-james.hilliard1@gmail.com>
References: <20210712043534.3849257-1-james.hilliard1@gmail.com>
Message-ID: <20210720214829.31a3bdf2@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 11 Jul 2021 22:35:34 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The overriden service files appear to have compatibility issues
> with upstream rpcbind, don't replace the bundled service files.
> 
> We need to build with --enable-warmstarts as this is required
> by the systemd service files.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rpcbind/rpcbind.mk      | 10 ++--------
>  package/rpcbind/rpcbind.service | 10 ----------
>  package/rpcbind/rpcbind.socket  |  8 --------
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 package/rpcbind/rpcbind.service
>  delete mode 100644 package/rpcbind/rpcbind.socket

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
