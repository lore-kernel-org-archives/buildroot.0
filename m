From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:09:40 +0200
Subject: [Buildroot] [PATCH] pkg-perl: move PERL_INC in configure step
In-Reply-To: <20180909092717.19375-1-francois.perrad@gadz.org>
References: <20180909092717.19375-1-francois.perrad@gadz.org>
Message-ID: <20180909150940.3d9df005@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 11:27:17 +0200, Francois Perrad wrote:
> this workaround for old ExtUtils-MakeMaker is now useless
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
