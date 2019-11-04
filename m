From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:35:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/piglit: set python executable
In-Reply-To: <20191103085520.9095-1-fontaine.fabrice@gmail.com>
References: <20191103085520.9095-1-fontaine.fabrice@gmail.com>
Message-ID: <20191104223542.5d972009@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 09:55:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Without this change, piglit will detect and use python from host
> resulting in build failures if python-mako, python-numpy or python-six
> are not installed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d782589b6073031626fd769982a0844f3731906
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/piglit/piglit.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
