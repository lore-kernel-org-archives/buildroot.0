From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:40:59 +0200
Subject: [Buildroot] [PATCH] package/python-markdown: Bump version to
 3.3.4
In-Reply-To: <20210628095351.1416546-1-gwenj@trabucayre.com>
References: <20210628095351.1416546-1-gwenj@trabucayre.com>
Message-ID: <20210629194059.GK2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2021-06-28 11:53 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-markdown/python-markdown.hash | 4 ++--
>  package/python-markdown/python-markdown.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
> index 4d54ce9243..b64ac77be0 100644
> --- a/package/python-markdown/python-markdown.hash
> +++ b/package/python-markdown/python-markdown.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/markdown/json
> -md5  7a894dc55992b37cdbcba5c4049455fc  Markdown-3.2.1.tar.gz
> -sha256  90fee683eeabe1a92e149f7ba74e5ccdc81cd397bd6c516d93a8da0ef90b6902  Markdown-3.2.1.tar.gz
> +md5  b6833c6326e9164ee0c662218a75e7f0  Markdown-3.3.4.tar.gz
> +sha256  31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49  Markdown-3.3.4.tar.gz
>  # Locally computed sha256
>  sha256  6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
> diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
> index 1f352fd7f1..801360d778 100644
> --- a/package/python-markdown/python-markdown.mk
> +++ b/package/python-markdown/python-markdown.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MARKDOWN_VERSION = 3.2.1
> +PYTHON_MARKDOWN_VERSION = 3.3.4
>  PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
> -PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/98/79/ce6984767cb9478e6818bd0994283db55c423d733cc62a88a3ffb8581e11
> +PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/49/02/37bd82ae255bb4dfef97a4b32d95906187b7a7a74970761fca1360c4ba22
>  PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
>  PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
>  PYTHON_MARKDOWN_SETUP_TYPE = setuptools
> -- 
> 2.20.1
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
