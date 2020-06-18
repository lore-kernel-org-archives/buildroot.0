From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 08:53:40 +0200
Subject: [Buildroot] [PATCH] package/pkg-python.mk: fixup typo,
 PYTHON#_PATH --> PHYON3_PATH
In-Reply-To: <CAJPHfYOEemAAOVwo0nkzRDGi6M913e3PMeBRff_ZzA1Si56emw@mail.gmail.com>
References: <CAJPHfYOEemAAOVwo0nkzRDGi6M913e3PMeBRff_ZzA1Si56emw@mail.gmail.com>
Message-ID: <20200618065340.GK2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yi, All,

On 2020-06-18 12:55 +0800, Yi Zheng spake thusly:
> Signed-off-by: Brock.Zheng <goodmenzy@gmail.com>

Applied to master, after fixing the mess introduced by gmail. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 31b53e281b..59a48e5a87 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -23,7 +23,7 @@
>  # basename does not evaluate if a file exists, so we must check to ensure
>  # the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
>  # an empty string if the file does not exist.
> -PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON#_PATH)/_sysconfigdata__linux_*.py
> +PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON3_PATH)/_sysconfigdata__linux_*.py
>  PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e
> $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename
> $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
> 
>  # Target distutils-based packages
> --
> 2.27.0

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
