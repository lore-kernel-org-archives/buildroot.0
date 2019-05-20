From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:33:26 +0200
Subject: [Buildroot] [PATCH 3/5] package/libepoxy: update to version
 1.5.3, convert to Meson
In-Reply-To: <20190514114111.20424-4-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-4-aperez@igalia.com>
Message-ID: <20190520213326.74609f54@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 14:41:09 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This release fixes building with uClibc and symbol lookups for
> drivers which have GLES 3.x support.
> 
> Tarballs do not include a generated "configure" script any more,
> so use Meson to configure the build instead.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libepoxy/libepoxy.hash |  4 ++--
>  package/libepoxy/libepoxy.mk   | 13 +++++++------
>  2 files changed, 9 insertions(+), 8 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
