From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 09:39:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/luvi: fix build with aarch64
In-Reply-To: <20191226082447.2130430-1-fontaine.fabrice@gmail.com>
References: <20191226082447.2130430-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226093919.5c9dffc7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 09:24:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> aarch64 is a supported architecture of luajit since switch to moonjit
> fork in commit 2ca0accc21a090874ac6e97670b47153a1f0a0b5 so manage this
> new target in luvi.mk to avoid an "unknown architecture" build failure
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ae610141b488d7ca8ea9db0575dec8f5eb13650c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/luvi/luvi.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
