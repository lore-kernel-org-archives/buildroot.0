From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:16:13 +0100
Subject: [Buildroot] [PATCH 1/1] qt5tools: fix typo in <pkg>_SOURCE
In-Reply-To: <20180210144906.23502-1-gael.portay@savoirfairelinux.com>
References: <20180210144906.23502-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180210161613.01ffc17c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Feb 2018 09:49:06 -0500, Ga?l PORTAY wrote:
> The QT5TOOLS_SOURCE variable uses mismatch QT5BASE_VERSION variable.
> 
> This commit fixes the typo by using the appropriate QT5TOOLS_VERSION
> variable.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5tools/qt5tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
