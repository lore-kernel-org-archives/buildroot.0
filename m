From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:00:37 +0100
Subject: [Buildroot] [PATCH v1] package/libubox: bump version to 551d75b
In-Reply-To: <20210310205002.18278-1-ps.report@gmx.net>
References: <20210310205002.18278-1-ps.report@gmx.net>
Message-ID: <20210314170037.GI2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-10 21:50 +0100, Peter Seiderer spake thusly:
> Changelog:
> 
>   2e52c7e libubox: fix BLOBMSG_CAST_INT64 (do not override BLOBMSG_TYPE_DOUBLE)
>   870acee tests: cram: test_base64: fix failing tests
>   4d8995e tests: cram: test_base64: really fix failing tests
>   551d75b libubox: tests: add more blobmsg/json test cases
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libubox/libubox.hash | 2 +-
>  package/libubox/libubox.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
> index fd4c5a4a39..94a071d80d 100644
> --- a/package/libubox/libubox.hash
> +++ b/package/libubox/libubox.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  e383caf80a241e9711ab0c58a5e8f4d16479693be1e44ffb6cc716a185e7e303  libubox-5bc0146a1d6474d339c4ade9a227f32cc27a8b93-br1.tar.gz
> +sha256  c6bac8baa7525b2d35eb22edeb5722c098370794d00e8859ef1a0bdfd8716151  libubox-551d75b5662cccd0466b990d58136bdf799a804d-br1.tar.gz
> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
> index 4626659158..20da5c2ec2 100644
> --- a/package/libubox/libubox.mk
> +++ b/package/libubox/libubox.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUBOX_VERSION = 5bc0146a1d6474d339c4ade9a227f32cc27a8b93
> +LIBUBOX_VERSION = 551d75b5662cccd0466b990d58136bdf799a804d
>  LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
>  LIBUBOX_SITE_METHOD = git
>  LIBUBOX_LICENSE = ISC, BSD-3-Clause
> -- 
> 2.30.1
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
