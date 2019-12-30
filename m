From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 12:30:34 +0100
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 Buildroot toolchains to 2019.11.1
In-Reply-To: <20191230100231.1418837-1-thomas.petazzoni@bootlin.com>
References: <20191230100231.1418837-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191230113034.GL26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-30 11:02 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/config-fragments/autobuild/br-aarch64-glibc.config | 4 ++--
[--SNIP--]
>  32 files changed, 85 insertions(+), 86 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
> index 42b1c3316c..961ff71573 100644
> --- a/support/config-fragments/autobuild/br-aarch64-glibc.config
> +++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
> @@ -2,8 +2,8 @@ BR2_aarch64=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2019.05.1.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2019.11.tar.bz2"

The commit title says '2019.11.1', but the version here (as well as for
all the other toolchains) is '2019.11'. Which should I trust? ;-)

I can fix the commit title when applying, if need be.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
