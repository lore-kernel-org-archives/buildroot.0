From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 20 Oct 2018 15:15:24 +0200
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for
 python-requests and python-certifi
In-Reply-To: <20181020125425.29281-1-asafka7@gmail.com>
References: <20181020125425.29281-1-asafka7@gmail.com>
Message-ID: <CAGm1_kte7is=wBp_WaQh=Pcqwa4b9=SzhxMjLG62pdhZK7ZwMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 20, 2018 at 2:54 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 341bf7de3b..f44dbe9950 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -203,6 +203,7 @@ F:  package/libuv/
>  F:     package/python-attrs/
>  F:     package/python-bcrypt/
>  F:     package/python-bitstring/
> +F:     package/python-certifi/
>  F:     package/python-constantly/
>  F:     package/python-engineio/
>  F:     package/python-fire/
> @@ -228,6 +229,7 @@ F:  package/python-pyroute2/
>  F:     package/python-pysmi/
>  F:     package/python-pytz/
>  F:     package/python-reentry/
> +F:     package/python-requests/
>  F:     package/python-sdnotify/
>  F:     package/python-subprocess32/
>  F:     package/python-txtorcon/

Why don't you just remove all python entries and replace it with:

package/python*

Yegor
