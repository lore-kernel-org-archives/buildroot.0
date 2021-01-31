From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:24:09 +0100
Subject: [Buildroot] [PATCH] package/gensio: bump version to 2.2.3
In-Reply-To: <20210131154210.25773-1-heiko.thiery@gmail.com>
References: <20210131154210.25773-1-heiko.thiery@gmail.com>
Message-ID: <20210131212409.5350793f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Jan 2021 16:42:10 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Drop upstream patch that is in new version.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...-Fix-a-compile-problem-when-disabled.patch | 31 -------------------
>  package/gensio/gensio.hash                    |  6 ++--
>  package/gensio/gensio.mk                      |  2 +-
>  3 files changed, 4 insertions(+), 35 deletions(-)
>  delete mode 100644 package/gensio/0001-sctp-Fix-a-compile-problem-when-disabled.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
