From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:10:17 +0200
Subject: [Buildroot] [PATCH] qt5base: remove unused definition
In-Reply-To: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
References: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180630181017.07d8e860@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 08:57:13 -0400, Ga?l PORTAY wrote:
> Since commit 81fb33af2a (qt5base: correct eglfs support in
> qmake.conf.in) the definition QT5BASE_CONFIGURE_QMAKE_CONFIG is left
> unused.
> 
> Remove it since it is not used anymore.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
