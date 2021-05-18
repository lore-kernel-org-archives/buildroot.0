From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 22:47:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: enable ebizzy
In-Reply-To: <20210429192103.7487-1-petr.vorel@gmail.com>
References: <20210429192103.7487-1-petr.vorel@gmail.com>
Message-ID: <20210518204715.GC2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2021-04-29 21:21 +0200, Petr Vorel spake thusly:
> ebizzy has been fixed in 20200930 (commit 967612c45).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 43ee134d1c..978d01b7a6 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -76,8 +76,7 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
>  	testcases/kernel/syscalls/getcontext/getcontext01.c \
>  	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
>  	testcases/kernel/syscalls/timer_create/timer_create01.c \
> -	testcases/kernel/syscalls/timer_create/timer_create03.c \
> -	utils/benchmark/ebizzy-0.3
> +	testcases/kernel/syscalls/timer_create/timer_create03.c
>  
>  # ldd command build system tries to build a shared library unconditionally.
>  LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_STATIC_LIBS) += \
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
