From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:58:58 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: concentrate on uClibc
In-Reply-To: <20180428203511.GA24621@waldemar-brodkorb.de>
References: <20180428203511.GA24621@waldemar-brodkorb.de>
Message-ID: <20180428225858.0cd63f20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 22:35:12 +0200, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3a4ad60..45a8979 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1952,11 +1952,6 @@ N:	Wade Berrier <wberrier@gmail.com>
>  F:	package/ngrep/
>  
>  N:	Waldemar Brodkorb <wbx@openadk.org>
> -F:	arch/Config.in.m68k
> -F:	arch/Config.in.or1k
> -F:	arch/Config.in.sparc
> -F:	package/glibc/
> -F:	package/mksh/
>  F:	package/uclibc/
>  F:	package/uclibc-ng-test/

I understand the wish to concentrate on a smaller number of topics.
However, who is going to take care of the m68k, sparc and OpenRISC
architecture in Buildroot? I think besides you, not many people were
interested by those architectures, and they cause fairly frequent
issues at the toolchain level. Do you have a proposal here ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
