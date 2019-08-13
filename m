From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 23:02:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: install to
 staging
In-Reply-To: <20190813203730.15746-1-fontaine.fabrice@gmail.com>
References: <20190813203730.15746-1-fontaine.fabrice@gmail.com>
Message-ID: <20190813230246.694b0036@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Aug 2019 22:37:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libcpprestsdk is a library so it makes sense to install it in
> staging even if no current package is using it for now
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=11936
> 
> Signed-off-by: Hein Gustavsen <hein.gustavsen@miros-group.com>
> 
> [Retrieved (and slightly update commit message) from:
> https://bugs.buildroot.org/show_bug.cgi?id=11936]
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/libcpprestsdk.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
