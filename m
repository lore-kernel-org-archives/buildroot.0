From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:38:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: bump version to
 0.6.8
In-Reply-To: <20210112083044.32439-1-heiko.thiery@gmail.com>
References: <20210112083044.32439-1-heiko.thiery@gmail.com>
Message-ID: <20210118223800.21c27d75@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2021 09:30:43 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Also drop upstream patches that are already in version.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...ezahn-remove-unused-MZ_SIZE_LONG_INT.patch |  41 ----
>  ...e-needlessly-global-variables-static.patch | 139 -------------
>  ...-variable-definitions-cli-h-to-cli-c.patch |  77 --------
>  ...le-definitions-from-mops-h-to-mops-c.patch |  69 -------
>  ...-definitions-from-llist-h-to-llist-c.patch |  47 -----
>  ...definitions-from-mz-h-to-mausezahn-c.patch | 184 ------------------
>  package/netsniff-ng/netsniff-ng.hash          |   2 +-
>  package/netsniff-ng/netsniff-ng.mk            |   2 +-
>  8 files changed, 2 insertions(+), 559 deletions(-)
>  delete mode 100644 package/netsniff-ng/0001-mausezahn-remove-unused-MZ_SIZE_LONG_INT.patch
>  delete mode 100644 package/netsniff-ng/0002-mausezahn-make-needlessly-global-variables-static.patch
>  delete mode 100644 package/netsniff-ng/0003-mausezahn-move-variable-definitions-cli-h-to-cli-c.patch
>  delete mode 100644 package/netsniff-ng/0004-mausezahn-move-variable-definitions-from-mops-h-to-mops-c.patch
>  delete mode 100644 package/netsniff-ng/0005-mausezahn-move-variable-definitions-from-llist-h-to-llist-c.patch
>  delete mode 100644 package/netsniff-ng/0006-mausezahn-move-variable-definitions-from-mz-h-to-mausezahn-c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
