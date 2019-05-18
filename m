From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:30:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
In-Reply-To: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
References: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
Message-ID: <20190518213005.707e045d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 May 2019 22:12:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5b3c7a3e7828107eaa9dad49ba2650466277d891 added a
> BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency to wpebackend-fdo but forget
> to add it to wpewebkit
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/49e04166de68358e69bce580b29ba3a25b313acf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wpewebkit/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
