From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 11:55:29 +0100
Subject: [Buildroot] [PATCH] toolchain-external: allow vendor-controlled
 defaults
In-Reply-To: <1290076101-31697-1-git-send-email-vapier@gentoo.org>
References: <1290076101-31697-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101118115529.2f2b57c5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Nov 2010 05:28:21 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  toolchain/toolchain-external/Config.in.2 |   11 +++++++++++
>  toolchain/toolchain-external/ext-tool.mk |    2 ++
>  2 files changed, 13 insertions(+), 0 deletions(-)

Could you explain a little bit the rationale behind this ?

> index 7e4645d..2501256 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -37,6 +37,8 @@
>  #  cross-compiler binaries remains external, all libraries and headers
>  #  are imported into the Buildroot tree.
>  
> +-include target/device/*/ext-tool.mk
> +

I definitely really don't like this. Could you elaborate a bit on what
you would like to do ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
