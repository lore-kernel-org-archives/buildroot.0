From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:39:31 +0100
Subject: [Buildroot] [PATCH 06/11] package/kodi: add hash for license
 file
In-Reply-To: <20191113151724.12155-7-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-7-peter@korsgaard.com>
Message-ID: <20191113203931.GN3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/kodi.hash | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index 8018c67a3a..2b2e5e64f9 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -8,3 +8,5 @@ sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236
>  sha256 312b3d15bc448d24e92f4b2e7248409525eccc4e75776026d805478e51c5ef3d  981488f.tar.gz
>  # Locally computed - libdvdread
>  sha256 e7179b2054163652596a56301c9f025515cb08c6d6310b42b897c3ad11c0199b  17d99db.tar.gz
> +# Locally computed
> +sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
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
