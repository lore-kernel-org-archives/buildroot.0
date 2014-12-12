From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:38:10 +0100
Subject: [Buildroot] [PATCH v3 1/2] Added mpd-mpc, mpc client to mpd
In-Reply-To: <1418419480-7570-1-git-send-email-tbultel@free.fr>
References: <1418419480-7570-1-git-send-email-tbultel@free.fr>
Message-ID: <1418427490.1462.2.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2014-12-12 at 22:24 +0100, Thierry Bultel wrote:
> ---
> 
> Changes v2 -> v3
>   - dependency to host-pkgconf (noticed by J?rg Krause)
>   - optional dependency to libiconv
>   - configure environnement for C99 compiler
> 
> Changes v1 -> v2
>   - No needed dependency to mpd (suggested by Thomas)
>   - Added hash and license information
> 
> Signed-off-by: Thierry Bultel <tbultel@free.fr>

Looks good to me!

Builds successfully on ARM target with musl.

Tested-by: J?rg Krause <jkrause@posteo.de>
