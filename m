From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 15:34:17 +0100
Subject: [Buildroot] [PATCH 1/1] qt53d: fix typo in <pkg>_SOURCES
In-Reply-To: <20180210123800.7707-1-gael.portay@savoirfairelinux.com>
References: <20180210123800.7707-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180210153417.3f4dee28@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Feb 2018 07:38:00 -0500, Ga?l PORTAY wrote:
> The QT53D_SOURCE variable uses mismatch QT5SVG_VERSION variable.
> 
> This commit fixes the typo by using the appropriate QT53D_VERSION
> variable.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt53d/qt53d.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
