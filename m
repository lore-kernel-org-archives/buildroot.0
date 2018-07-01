From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:34:02 +0200
Subject: [Buildroot] [PATCH 2/3] systemd: add support for PCRE2
In-Reply-To: <20180629222552.12808-3-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
 <20180629222552.12808-3-jeremy.rosen@smile.fr>
Message-ID: <20180701143402.336b1de2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 00:25:51 +0200, J?r?my Rosen wrote:
> systemd can use libpcre2 when available
> add detection of that library
> 
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
