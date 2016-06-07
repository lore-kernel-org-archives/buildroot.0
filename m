From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:44:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] babeld: new package
In-Reply-To: <1465331732-8421-1-git-send-email-christian@paral.in>
References: <1465331732-8421-1-git-send-email-christian@paral.in>
Message-ID: <20160607224407.6bdcfa93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 13:35:32 -0700, Christian Stewart wrote:

> +define BABELD_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"

So you are building a target package with the host compiler?

Come on, please pay attention... at least runtime test your new
packages!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
