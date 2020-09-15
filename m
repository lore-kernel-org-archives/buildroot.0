From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 20:50:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: XvMC needs x11
In-Reply-To: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
References: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
Message-ID: <20200915205001.42454827@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Dec 2019 14:14:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Selects BR2_PACKAGE_MESA3D_NEEDS_X11 hidden option to enable x11
> platform if the user selects BR2_PACKAGE_MESA3D_XVMC
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e044609e603ca68695d842d08809fdcb35bc8127
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Turns out this was fixed by a patch from Bernd, submitted many months
later, but we had forgotten about your older patch. Sorry about that.
See commit c35fe399cdae023005a1d156fd913ad6d7f7d177.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
