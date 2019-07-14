From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:12:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/glib-networking: drop
 host-intltool
In-Reply-To: <20190705183540.16524-1-fontaine.fabrice@gmail.com>
References: <20190705183540.16524-1-fontaine.fabrice@gmail.com>
Message-ID: <20190714161259.44df7754@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Jul 2019 20:35:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> intltool is not needed since version 2.49.90 and
> https://gitlab.gnome.org/GNOME/glib-networking/commit/f539b7ebdb28bcf58cb2b6b86a15f33f563edaa8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glib-networking/glib-networking.mk | 1 -
>  1 file changed, 1 deletion(-)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
