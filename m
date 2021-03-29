From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Mar 2021 10:35:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5webkit: add SoB line to 'Fix
 ICU related compile failures from capital bool' patch
In-Reply-To: <20210329082856.12981-1-henri.roosen@ginzinger.com>
References: <20210329082856.12981-1-henri.roosen@ginzinger.com>
Message-ID: <20210329083547.GW24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Henri, All,

On 2021-03-29 10:28 +0200, Henri Roosen spake thusly:
> Fixes: 0f6c209a1d76 ("package/qt5webkit: fix ICU related compile failures from capital bool defines")
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...9-Fix-ICU-related-compile-failures-from-capital-bool-d.patch | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
> index 04f41afee037..7d941a5683fe 100644
> --- a/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
> +++ b/package/qt5/qt5webkit/0009-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
> @@ -4,6 +4,8 @@ Date: Thu, 18 Mar 2021 11:53:57 +0100
>  Subject: [PATCH] Fix ICU related compile failures from capital bool defines
>  
>  See ICU-21267
> +
> +Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
>  ---
>   .../platform/text/TextBreakIteratorICU.cpp       | 16 ++++++++--------
>   Source/WebCore/platform/text/TextCodecICU.cpp    |  2 +-
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
