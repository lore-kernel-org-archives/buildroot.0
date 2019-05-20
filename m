From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 23:01:19 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: host variant inherits
 DL_SUBDIR
In-Reply-To: <20190428174458.10458-1-yann.morin.1998@free.fr>
References: <20190428174458.10458-1-yann.morin.1998@free.fr>
Message-ID: <20190520230119.05902d36@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 28 Apr 2019 19:44:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We have no clear separation between variables that should be
> automatically inherited by the host variant, from the target
> variant, and those variables that should not be inherited.
> 
> However, it clearly makes sense that the host variant does inherit
> all the download variables, of which the sub-directory.
> 
> Notes: currently, only three packages define HOST_FOO_DL_SUBDIR,
> but they all are host-only packages anyway, so needs not be fixed:
>   - gcc-initial
>   - gcc-final
>   - python3-setuptools
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-generic.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Following the comments from Arnout, I marked this patch as Changes
Requested in patchwork. Could you send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
