From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:19:08 +0200
Subject: [Buildroot] [PATCH] pdbg: Bump version to v2.3
In-Reply-To: <20191002025652.19710-1-joel@jms.id.au>
References: <20191002025652.19710-1-joel@jms.id.au>
Message-ID: <20191002211908.009c6fd8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 12:26:52 +0930
Joel Stanley <joel@jms.id.au> wrote:

> Drop the endian.h patch has this has been fixed upstream.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../0001-src-thread.c-include-endian.h.patch  | 35 -------------------
>  package/pdbg/pdbg.hash                        |  2 +-
>  package/pdbg/pdbg.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 package/pdbg/0001-src-thread.c-include-endian.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
