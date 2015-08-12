From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Aug 2015 10:23:34 +0200
Subject: [Buildroot] [PATCH] u-boot: 2015.07 - fix creation of .config
In-Reply-To: <1439295600.3252.2.camel@synopsys.com>
References: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
 <20150731161818.2056383e@free-electrons.com>
 <1438355649.4848.41.camel@synopsys.com>
 <1438600559.13201.4.camel@synopsys.com>
 <1439295600.3252.2.camel@synopsys.com>
Message-ID: <20150812102334.15742776@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 11 Aug 2015 12:20:01 +0000, Alexey Brodkin wrote:

> Any chance for this one to be applied?
> Note without this change or anything similar U-Boot from
> snsp_axs10x_defconfig fails to config.

I haven't had the time to look into this in detail. It would be great
if Yann, or J?rg could have a look. I remain unhappy with solving such
a problem by using a patch against U-Boot 2015.07, because it means
anyone specifying a slightly different U-Boot version (but based on
2015.07) will still have the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
