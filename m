From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:49:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/psplash: add host-gdk-pixbuf
 mandatory dependency
In-Reply-To: <20200311220808.1079295-1-fontaine.fabrice@gmail.com>
References: <20200311220808.1079295-1-fontaine.fabrice@gmail.com>
Message-ID: <20200411154927.29b31a14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 23:08:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gdk-pixbuf-csource is needed since
> http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=f7a354dd7991bda57ab8b26d6491687d777f88da
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cb46d93b90ca3b297d0e18fd84796660e20c3a52
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/psplash/psplash.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
