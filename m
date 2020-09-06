From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 22:26:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3-requests: fix version
In-Reply-To: <20200906201643.27411-1-fontaine.fabrice@gmail.com>
References: <20200906201643.27411-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906202641.GP14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-06 22:16 +0200, Fabrice Fontaine spake thusly:
> Commit a01bf684ea0d6eed9755bb4bf43986720ede722e forgot to update
> PYTHON3_REQUESTS_VERSION
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ecf4abdd15bb267b77bd1f5097dc7e0b35c38dd7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python3-requests/python3-requests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python3-requests/python3-requests.mk b/package/python3-requests/python3-requests.mk
> index e2bb00eab2..cd6a7e1260 100644
> --- a/package/python3-requests/python3-requests.mk
> +++ b/package/python3-requests/python3-requests.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Please keep in sync with package/python-requests/python-requests.mk
> -PYTHON3_REQUESTS_VERSION = 2.23.0
> +PYTHON3_REQUESTS_VERSION = 2.24.0
>  PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON3_REQUESTS_VERSION).tar.gz
>  PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915
>  PYTHON3_REQUESTS_SETUP_TYPE = setuptools
> -- 
> 2.28.0
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
