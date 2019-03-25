From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 13:24:01 +0100
Subject: [Buildroot] [PATCH] package/sunxi-tools: Fix build meminfo with
 musl
In-Reply-To: <20190303232340.23904-1-vadim4j@gmail.com> (Vadim Kochan's
 message of "Mon, 4 Mar 2019 01:23:40 +0200")
References: <20190303232340.23904-1-vadim4j@gmail.com>
Message-ID: <87ef6vnnvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > musl does not provide inx/outx API for ARM arch, so use
 > io memory access via pointers which is actually done this
 > way in glibc/ulibc.

 > Fixes:
 >     http://autobuild.buildroot.net/results/bf10cbe40c0f672c34db72e4eea4c168d5932bd4/

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 > ---

 > PATCH v1:
 >        1) Tested on board with A13 SoC

 > RFT v2:
 >        1) Fixed mistaken copy-paste-n-replace of outl by sunxi_io_write in sunxi_io_mask(...)

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
