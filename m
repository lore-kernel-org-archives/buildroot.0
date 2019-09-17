From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:04:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: depends on
 BR2_TOOLCHAIN_HAS_SYNC_1
In-Reply-To: <20190916170124.20508-1-fontaine.fabrice@gmail.com>
References: <20190916170124.20508-1-fontaine.fabrice@gmail.com>
Message-ID: <20190917220457.1dfc777c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 19:01:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/512904ace780508de5e3a56b0094bbe6287d751e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/haproxy/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
