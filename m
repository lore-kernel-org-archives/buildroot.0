From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:44:20 +0200
Subject: [Buildroot] [PATCH v1] package/weston: change download url to
 https
In-Reply-To: <20200916195540.25640-1-ps.report@gmx.net>
References: <20200916195540.25640-1-ps.report@gmx.net>
Message-ID: <20200917214420.022a64ff@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:55:40 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

>   - change download url to https (as given by the original announcement [1]
>     and redirected by the http url)
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/00b9e1ccb97d9ff5c2ee0e856288f689bdab52ee
> 
>   >>> weston 9.0.0 Downloading[23m  
>   --2020-09-15 14:10:22--  http://wayland.freedesktop.org/releases/weston-9.0.0.tar.xz
>   Resolving wayland.freedesktop.org (wayland.freedesktop.org)... 35.227.58.183
>   Connecting to wayland.freedesktop.org (wayland.freedesktop.org)|35.227.58.183|:80... connected.
>   HTTP request sent, awaiting response... 308 Permanent Redirect
>   2020-09-15 14:10:23 ERROR 308: Permanent Redirect.
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/weston/weston.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
