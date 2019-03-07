From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:36:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable on microblaze
 and xtensa
In-Reply-To: <20190306180216.20337-1-fontaine.fabrice@gmail.com>
References: <20190306180216.20337-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307213657.72d25e51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Mar 2019 19:02:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/cdf0fb462eec143ea881d43cdd0c69c86122f66b
>  - http://autobuild.buildroot.org/results/df4d9702959b610762e87cf21fac9de62365dae6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
