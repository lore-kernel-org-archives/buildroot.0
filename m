From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:39:31 +0100
Subject: [Buildroot] [PATCH 08/13] docs/manual: update external
 toolchain examples
In-Reply-To: <1393167879-16637-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223153931.GI3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Replace ADI by Analog Devices, which is clearer for most people, and
> remove the Xilinx external toolchains since we have deprecated them.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/configure.txt | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index b566e8a..a6afafb 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -138,10 +138,9 @@ http://www.linaro.org[Linaro] for ARM,
>  http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/[Sourcery
>  CodeBench] for ARM, x86, x86-64, PowerPC, MIPS and SuperH,
>  https://blackfin.uclinux.org/gf/project/toolchain[Blackfin toolchains
> -from ADI], http://git.xilinx.com/[Xilinx toolchains for Microblaze],
> -etc.) and is capable of downloading them automatically, or it can be
> -pointed to a custom toolchain, either available for download or
> -installed locally.
> +from Analog Devices], etc.) and is capable of downloading them
> +automatically, or it can be pointed to a custom toolchain, either
> +available for download or installed locally.
>  
>  Then, you have three solutions to use an external toolchain:
>  
> -- 
> 1.8.3.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
