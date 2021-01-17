From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:00:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/czmq: bump to version 4.2.1
In-Reply-To: <20210117155724.372819-1-asafka7@gmail.com>
References: <20210117155724.372819-1-asafka7@gmail.com>
Message-ID: <20210117160036.GP2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2021-01-17 17:57 +0200, Asaf Kahlon spake thusly:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/czmq/czmq.hash | 6 +++---
>  package/czmq/czmq.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
> index 4738c9c434..19e2053a0a 100644
> --- a/package/czmq/czmq.hash
> +++ b/package/czmq/czmq.hash
> @@ -1,6 +1,6 @@
>  # From https://github.com/zeromq/czmq/releases
> -md5 7e09997db6ac3b25e8ed104053040722 czmq-4.2.0.tar.gz
> -sha1 42165b3eede517708814e5a1b6972d8bde417f7a czmq-4.2.0.tar.gz
> +md5 471e9ec120fc66a2fe2aae14359e3cfa czmq-4.2.1.tar.gz
> +sha1 75ced09c143f93fae65238375e3a799c40eaed4c czmq-4.2.1.tar.gz
>  # Locally calculated
> -sha256 cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb czmq-4.2.0.tar.gz
> +sha256 5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39 czmq-4.2.1.tar.gz
>  sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENSE
> diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
> index 1c9493cb76..8ddd9e8f95 100644
> --- a/package/czmq/czmq.mk
> +++ b/package/czmq/czmq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CZMQ_VERSION = 4.2.0
> +CZMQ_VERSION = 4.2.1
>  CZMQ_SITE = https://github.com/zeromq/czmq/releases/download/v$(CZMQ_VERSION)
>  
>  CZMQ_INSTALL_STAGING = YES
> -- 
> 2.27.0
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
