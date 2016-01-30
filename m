From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:37:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/lm-sensors: fix download URL
In-Reply-To: <1454102179-26118-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454102179-26118-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160130083713.02ac5475@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 29 Jan 2016 22:16:18 +0100, Bernd Kuhls wrote:
> According to http://www.lm-sensors.org/
> "the previous hosting for lm-sensors.org has been discontinued and the
>  former website maintainers can't be reached. For now, please refer to
>  the Internet Archive of the old site until a replacement is created:
>  https://web.archive.org/web/20150905145034/http://www.lm-sensors.org/"
> 
> This site points to ftp://ftp.netroedge.com/pub/lm-sensors/ as a mirror
> site for this package, so let's use it until upstream can fix its web
> site.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lm-sensors/lm-sensors.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
