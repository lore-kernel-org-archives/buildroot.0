From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:27:29 +0200
Subject: [Buildroot] [PATCH] babeld: New package
In-Reply-To: <1467410771-12765-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467410771-12765-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702152729.40b39c61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 00:06:11 +0200, Maxime Hadjinlian wrote:

> +define BABELD_INSTALL_TARGET_CMDS
> +	install -D -m 755 $(@D)/babeld $(TARGET_DIR)/usr/sbin/babeld

$(INSTALL) here.

Applied with this fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
