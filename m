From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:40:19 +0100
Subject: [Buildroot] [PATCH v2 branch/next] uboot-tools: fix dtc
 invocation
In-Reply-To: <20171201124020.4475-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Fri, 1 Dec 2017 13:40:20
 +0100")
References: <20171201124020.4475-1-yegorslists@googlemail.com>
Message-ID: <87k1x8tsos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Since uboot 2017.09 path to dtc will be configured via Kconfig. As BR
 > skips this step for uboot-tools building one has to provide
 > CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line. Otherwise
 > mkimage will not be able to create FIT images, i.e.:

 > mkimage -f kernel-fit.its kernel-fit.itb

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1 -> v2:
 >   - pass CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line
 >     instead of patching the Makefile (suggested by Thomas Petazzoni)

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
