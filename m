From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:41:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-devtools: select
 BR2_PACKAGE_GSTREAMER1_CHECK
In-Reply-To: <20200925211655.3400054-1-fontaine.fabrice@gmail.com>
References: <20200925211655.3400054-1-fontaine.fabrice@gmail.com>
Message-ID: <20200926154110.446bfd43@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 23:16:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> validate option needs gstreamer-check-1.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/297ebea95b487f4c542e1217620e8c3d921260f3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-devtools/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
