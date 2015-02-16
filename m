From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Feb 2015 10:17:47 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Fix ARM variant typo
In-Reply-To: <1424075092-19231-1-git-send-email-shmuelzon@gmail.com>
References: <1424075092-19231-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <CAHXCMMLFy8uJ=yQAN9rp9RndCv7BrgFKc4wxZq9Fw5J3LGBynw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 16, 2015 at 9:24 AM, Assaf Inbal <shmuelzon@gmail.com> wrote:
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 6c9955d..eacd641 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -212,7 +212,7 @@ endif
>  ifeq ($(BR2_arm),y)
>  CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)l
>  else ifeq ($(BR2_armeb),y)
> -CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSORARM_VARIANT)b
> +CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)b
>  else
>  CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
>  endif
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
