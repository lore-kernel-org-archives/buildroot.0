From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:04:46 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/gensio: bump to version 2.0.1
In-Reply-To: <20200409202529.62795-1-james.hilliard1@gmail.com>
References: <20200409202529.62795-1-james.hilliard1@gmail.com>
Message-ID: <20200411100446.5d5f9a15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Apr 2020 14:25:28 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Removed patch that is now upstream.
> 
> Removed GENSIO_AUTORECONF as we no longer patch configure.ac.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - remove fixes from commit message as it is no longer relevant
> Changes v1 -> v2:
>   - rebase on top of master
> ---
>  ...r-Rename-some-variables-to-tr_stdxxx.patch | 109 ------------------
>  package/gensio/gensio.hash                    |   6 +-
>  package/gensio/gensio.mk                      |   4 +-
>  3 files changed, 4 insertions(+), 115 deletions(-)
>  delete mode 100644 package/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
