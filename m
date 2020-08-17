From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 15:14:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.55.1
In-Reply-To: <20200816124806.2726538-1-james.hilliard1@gmail.com>
References: <20200816124806.2726538-1-james.hilliard1@gmail.com>
Message-ID: <20200817151421.1323bb5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Aug 2020 06:48:06 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop fix rpath match pattern patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...003-backends-fix-rpath-match-pattern.patch | 123 ------------------
>  package/meson/meson.hash                      |   4 +-
>  package/meson/meson.mk                        |   2 +-
>  3 files changed, 3 insertions(+), 126 deletions(-)
>  delete mode 100644 package/meson/0003-backends-fix-rpath-match-pattern.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
