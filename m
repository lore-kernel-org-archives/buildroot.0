From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Feb 2017 14:51:27 +0100
Subject: [Buildroot] [PATCH v6 2/9] qt5enginio : move into legacy
 compatibility
In-Reply-To: <1485849551-20469-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <843961e5-9d12-6512-9138-07f4a200f183@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-01-17 08:59, Zoltan Gyarmati wrote:
> From: Julien Corjon <corjon.j@ecagroup.com>
> 
> See https://wiki.qt.io/New_Features_in_Qt_5.7

 This is of course not perfect, because we now still have a Qt 5.6 version where
it is not legacy compatibility. However, it looks like fixing that would
complicate matters too much.

 Is it really useful to have these subdivisions? Maybe it's better to just add
this information in the help text?

 BTW, if anybody feels up to it: it would be useful to have proper help texts
for the qt5 modules.

 Regards,
 Arnout

> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/qt5/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index eb97fba..faa58d8 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -48,7 +48,6 @@ source "package/qt5/qt5base/Config.in"
>  source "package/qt5/qt5canvas3d/Config.in"
>  source "package/qt5/qt5connectivity/Config.in"
>  source "package/qt5/qt5declarative/Config.in"
> -source "package/qt5/qt5enginio/Config.in"
>  source "package/qt5/qt5graphicaleffects/Config.in"
>  source "package/qt5/qt5imageformats/Config.in"
>  source "package/qt5/qt5location/Config.in"
> @@ -67,6 +66,7 @@ source "package/qt5/qt53d/Config.in"
>  source "package/qt5/qt5quickcontrols2/Config.in"
>  source "package/qt5/qt5serialbus/Config.in"
>  comment "legacy compatibility"
> +source "package/qt5/qt5enginio/Config.in"
>  source "package/qt5/qt5script/Config.in"
>  source "package/qt5/qt5webkit/Config.in"
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
