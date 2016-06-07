From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 09:23:54 +0200
Subject: [Buildroot] [PATCH v1 1/1] babeld: new package
In-Reply-To: <1465274839-27236-1-git-send-email-christian@paral.in>
References: <1465274839-27236-1-git-send-email-christian@paral.in>
Message-ID: <20160607092354.6057e99c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Jun 2016 21:47:19 -0700, Christian Stewart wrote:

> +define BABELD_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef

Are you *sure* this is producing a binary built for the target? Since
you are not passing any CC/LD/CXX/etc. variables, I doubt it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
