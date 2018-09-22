From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:58:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] libxslt: point to the correct
 xml2-config location
In-Reply-To: <20180921145836.30424-1-ferdinand@ombud.nl>
References: <20180921145836.30424-1-ferdinand@ombud.nl>
Message-ID: <20180922185800.042ad08c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 16:58:36 +0200, Ferdinand van Aartsen wrote:
> Currently libxslt configure finds native /usr/bin/xml2-config.
> 
> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
> ---
> Changes v1 -> v2:
>   - Title format change (requested by Thomas).
>   - Drop the unneeded host changes.
> ---
>  package/libxslt/libxslt.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
