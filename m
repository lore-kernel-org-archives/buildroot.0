From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:26:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pymupdf: fix tarball
 name for sha256
In-Reply-To: <20210612151908.542978-1-fontaine.fabrice@gmail.com>
References: <20210612151908.542978-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612212615.GF168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 17:19 +0200, Fabrice Fontaine spake thusly:
> Fix tarball name for sha256 which is wrong since the addition of the
> package in commit 71f7fc8a27af383d3307945bf6e880491cb74bd4
> 
> While at it, also update indentation to 2 spaces
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pymupdf/python-pymupdf.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
> index 6729c6b91b..a5a53997cd 100644
> --- a/package/python-pymupdf/python-pymupdf.hash
> +++ b/package/python-pymupdf/python-pymupdf.hash
> @@ -1,3 +1,3 @@
>  # md5, sha256 from https://pypi.org/pypi/pymupdf/json
> -md5	0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
> -sha256	1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  python-pymupdf-1.16.0.tar.gz
> +md5  0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
> +sha256  1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  PyMuPDF-1.16.0.tar.gz
> -- 
> 2.30.2
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
