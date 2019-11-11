From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:30:17 +0100
Subject: [Buildroot] [PATCH] package/qt5wayland: fix installation with
 Qt 5.6
In-Reply-To: <20191110234916.1473-1-unixmania@gmail.com>
References: <20191110234916.1473-1-unixmania@gmail.com>
Message-ID: <20191111163017.012a1073@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Nov 2019 20:49:16 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Install QtWayland only if the latest Qt version is selected. It does not
> exist in version 5.6.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/qt5/qt5wayland/qt5wayland.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
