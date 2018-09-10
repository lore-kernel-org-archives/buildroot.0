From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:42:28 +0200
Subject: [Buildroot] [PATCH] pkg-perl: fix previous commit
In-Reply-To: <20180909140206.21822-1-francois.perrad@gadz.org>
References: <20180909140206.21822-1-francois.perrad@gadz.org>
Message-ID: <20180910174228.0b464f43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 16:02:06 +0200, Francois Perrad wrote:
> there is no variable PERL_INSTALL_NAME in master
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-perl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
