From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 19:12:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx: update SITE to
 use NXP url
In-Reply-To: <20191202200500.418195-1-juju@cotds.org> (Julien Olivain's
 message of "Mon, 2 Dec 2019 21:05:00 +0100")
References: <20191202200500.418195-1-juju@cotds.org>
Message-ID: <878sn2vrkq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <juju@cotds.org> writes:

 > NXP BSPs has been using the nxp.com URL for a while:
 > http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/commit/conf/layer.conf?id=d6abbbc1ce0882bdc82e03b1868eeba1a50a7bd3

 > It's  unclear for how long the freescale.com redirect will be
 > maintained. This patch update the FREESCALE_IMX_SITE variable
 > to point directly to the NXP site.

 > Signed-off-by: Julien Olivain <juju@cotds.org>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
