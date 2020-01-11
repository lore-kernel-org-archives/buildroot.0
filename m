From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:52:00 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/snort: needs zlib
In-Reply-To: <20200110172818.17155-1-ps.report@gmx.net>
References: <20200110172818.17155-1-ps.report@gmx.net>
Message-ID: <20200111155200.0ca0a358@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jan 2020 18:28:17 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   checking zlib.h usability... no
>   checking zlib.h presence... no
>   checking for zlib.h... no
> 
>      ERROR!  zlib header not found, go get it from
>      http://www.zlib.net
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/snort/Config.in | 1 +
>  package/snort/snort.mk  | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Thanks, series applied. For PATCH 1/2, I've extended the commit log
with more details.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
