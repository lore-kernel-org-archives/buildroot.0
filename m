From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:47:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: drop wrong
 linux-headers dependency
In-Reply-To: <20200811223740.2473421-1-fontaine.fabrice@gmail.com>
References: <20200811223740.2473421-1-fontaine.fabrice@gmail.com>
Message-ID: <20200812164740.2705992e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Aug 2020 00:37:40 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> Commit 9ffcd9279e5505535a73cf1200b3a86fd425cf32 wrongly added a
> linux-headers dependency when switching to meson.
> 
> Remove it as headers are always provided by the toolchain.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/iputils/iputils.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
