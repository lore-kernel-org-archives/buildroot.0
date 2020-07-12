From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 22:30:52 +0200
Subject: [Buildroot] [PATCH] package/tslib: update to 1.22
In-Reply-To: <20200701105041.2075-1-martink@posteo.de>
References: <20200701105041.2075-1-martink@posteo.de>
Message-ID: <20200712223052.7a9d9256@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  1 Jul 2020 12:50:41 +0200
Martin Kepplinger <martink@posteo.de> wrote:

> The removed patches are of course part of this release and
> https://github.com/libts/tslib/releases has a very short changelog.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 386 ------------------
>  ...-with-input_event_sec-for-old-kernel.patch |  28 --
>  package/tslib/tslib.hash                      |   4 +-
>  package/tslib/tslib.mk                        |   2 +-
>  4 files changed, 3 insertions(+), 417 deletions(-)
>  delete mode 100644 package/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  delete mode 100644 package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
