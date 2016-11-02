From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 23:26:46 +0100
Subject: [Buildroot] [PATCH 1/1] Bump libxmlrpc
In-Reply-To: <1478080601-8754-1-git-send-email-alvaro.gamez@hazent.com>
References: <20160825063044.CF4CA101E4C@stock.ovh.net>
 <1478080601-8754-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20161102232646.69bfff3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Nov 2016 10:56:41 +0100, Alvaro G. M wrote:
> Signed-off-by: Alvaro Gamez <alvaro.gamez@hazent.com>

Thanks for your contribution. However, there are a few issues with it:

 - The title should be:

	libxmlrpc: bump to version xyz

 - The commit log should contain a lot more details, especially:

   * what changes are made to the patches

   * why you are adding the AR and RANLIB definitions in MAKE_OPTS

Could you rework your patch accordingly?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
