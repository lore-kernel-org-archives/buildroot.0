From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 23:24:40 +0200
Subject: [Buildroot] [PATCH] pdbg: Bump version to v3.0
In-Reply-To: <20200713050359.3830866-1-joel@jms.id.au>
References: <20200713050359.3830866-1-joel@jms.id.au>
Message-ID: <20200713232440.6b7fbb9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 14:33:59 +0930
Joel Stanley <joel@jms.id.au> wrote:

> This includes a patch to fix building with uclibc, where pdbg was
> missing a header for ssize_t.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../pdbg/0001-Fix-building-with-uclibc.patch  | 32 +++++++++++++++++++
>  package/pdbg/pdbg.hash                        |  2 +-
>  package/pdbg/pdbg.mk                          |  2 +-
>  3 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 package/pdbg/0001-Fix-building-with-uclibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
