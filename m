From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 10:03:39 +0100
Subject: [Buildroot] [PATCH 1/6] package/kodi-audioencoder-vorbis: add
 license file hash
In-Reply-To: <20200204062018.11658-1-heiko.thiery@gmail.com>
References: <20200204062018.11658-1-heiko.thiery@gmail.com>
Message-ID: <20200204090339.GA3101@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-02-04 07:20 +0100, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Whole series applied, thanks.

I took the opportunity to also apply the nw trending spacing between
fields while at it (not all patches were consistent).

As for the mii-diag hash mismatch of yesterday, I know understood what
hapenned: it was the hash of the file before patching.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
> index aab1a6bcd7..ffdf138cf5 100644
> --- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
> +++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
>  sha256 0bc1470ecef83ecc7e36239ef414abc49380394b551d35eb7bcc6704e74b469c  kodi-audioencoder-vorbis-2.0.3-Leia.tar.gz
> +sha256 34c561f838b57d681bb795de0a26eacf610477a50cdca1ae707591ec607de42a  src/EncoderVorbis.cpp
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
