From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Thu, 29 Sep 2016 18:53:20 +0530
Subject: [Buildroot] [PATCH] libtasn1: clarify licensing info
In-Reply-To: <1475111638-24640-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1475111638-24640-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <57ED15C8.5040805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thursday 29 September 2016 06:43 AM, 
gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>
> The library is LGPLv2.1+, the tests and tools are GPLv3+ so clarify to
> avoid confusion.
>
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>   package/libtasn1/libtasn1.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index 6b7e6b3..79223a4 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -7,7 +7,7 @@
>   LIBTASN1_VERSION = 4.9
>   LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
>   LIBTASN1_DEPENDENCIES = host-bison
> -LIBTASN1_LICENSE = GPLv3+, LGPLv2.1+
> +LIBTASN1_LICENSE = GPLv3+ (tests, tools), LGPLv2.1+ (library)

examples are also licensed under GPLv3+. But I'm not sure if we should 
add both tests and examples here when those don't go on target file system.

Apart form that

Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Regards,
Rahul
