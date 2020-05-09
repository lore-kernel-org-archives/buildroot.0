From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2020 22:38:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: fix typo in hash
 file
In-Reply-To: <20200509184324.1006590-1-asafka7@gmail.com>
References: <20200509184324.1006590-1-asafka7@gmail.com>
Message-ID: <20200509203806.GS12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-05-09 21:43 +0300, Asaf Kahlon spake thusly:
> 'computer' -> 'computed'.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-attrs/python-attrs.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
> index f8c38ee4ed..7fba53d535 100644
> --- a/package/python-attrs/python-attrs.hash
> +++ b/package/python-attrs/python-attrs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/attrs/json
>  md5	5b2db50fcc31be34d32798183c9bd062  attrs-19.3.0.tar.gz
>  sha256	f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72  attrs-19.3.0.tar.gz
> -# Locally computer sha256
> +# Locally computed sha256
>  sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
> -- 
> 2.26.2
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
