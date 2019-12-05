From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:06:09 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: test per-package
 directories
In-Reply-To: <20191203145904.1070561-1-thomas.petazzoni@bootlin.com>
References: <20191203145904.1070561-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191205230609.719021fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 15:59:03 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Now that the support for per-package directories has been merged, it
> is time to get some exposure for it in the autobuilders, so let's
> build 1 out of 15 builds with this feature enabled, at least as an
> initial step.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/genrandconfig | 4 ++++
>  1 file changed, 4 insertions(+)

This patch was applied to master by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
