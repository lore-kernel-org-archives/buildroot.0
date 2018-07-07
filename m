From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 00:18:21 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: fix alphabetic order
In-Reply-To: <a175f85858a4971691df0179a1598a67ecf6300f.1530776123.git.baruch@tkos.co.il>
References: <a175f85858a4971691df0179a1598a67ecf6300f.1530776123.git.baruch@tkos.co.il>
Message-ID: <ffcc2f89-933d-ecbf-06b4-637c3551ac77@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-18 09:35, Baruch Siach wrote:
> Move Pierre's entry to its correct place.

 Applied to master, thanks.

 There are still a few others that are wrong: Antony Pavlov, C?dric Ch?pied,
Joseph Kogut, Laurent Charpentier, Mike Harmony, Roman Gorbenkov. Care to fix
those as well?

 Regards,
 Arnout

> 
> Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  DEVELOPERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1fa0020dbbea..cba1344d1dc7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1609,6 +1609,9 @@ F:	package/lttng-tools/
>  F:	package/python-ipython/
>  F:	package/liburcu/
>  
> +N:	Pierre Ducroquet <pinaraf@pinaraf.info>
> +F:	package/kf5/
> +
>  N:	Pierre Floury <pierre.floury@gmail.com>
>  F:	package/trace-cmd/
>  
> @@ -2143,6 +2146,3 @@ F:	package/qjson/
>  F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/tinc/
> -
> -N:	Pierre Ducroquet <pinaraf@pinaraf.info>
> -F:	package/kf5/
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
