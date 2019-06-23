From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:19:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: drop unrecognized
 option
In-Reply-To: <20190623120641.13814-1-fontaine.fabrice@gmail.com>
References: <20190623120641.13814-1-fontaine.fabrice@gmail.com>
Message-ID: <20190623171957.6966f621@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 14:06:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --enable-old-stdlib-cache is not recognozed since at least version
> 3.6.3, see:
> http://autobuild.buildroot.org/results/b957f956100fc36c7d5ffab1d7df41a65ae52ded
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python3/python3.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
