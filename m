From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:17:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: bump to version 5.2.1
In-Reply-To: <20190806175800.3731-1-fontaine.fabrice@gmail.com>
References: <20190806175800.3731-1-fontaine.fabrice@gmail.com>
Message-ID: <20190806221724.49c5802a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 19:58:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch: documentation can be disabled through --disable-doc since
> https://github.com/jemalloc/jemalloc/commit/702d76dbd03e4fe7347399e1e322c80102c95544
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../jemalloc/0001-Disable-documentation.patch | 29 -------------------
>  package/jemalloc/jemalloc.hash                |  2 +-
>  package/jemalloc/jemalloc.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 package/jemalloc/0001-Disable-documentation.patch

I was a bit confused by what passes the --disable-doc option, since
you're not changing the .mk file for that. But it gets passed by the
autotools infra. I've added a note about this in the commit log, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
