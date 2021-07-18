From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:33:36 +0200
Subject: [Buildroot] [PATCH 1/4] package/mpv: fix reproducible build
 issues
In-Reply-To: <20210618192237.808519-1-bernd.kuhls@t-online.de>
References: <20210618192237.808519-1-bernd.kuhls@t-online.de>
Message-ID: <20210718233336.414988c8@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 18 Jun 2021 21:22:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Do not include the build date when creating reproducible builds.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpv/mpv.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
