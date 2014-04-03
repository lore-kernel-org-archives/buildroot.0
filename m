From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:16:10 +0200
Subject: [Buildroot] [PATCH 1/2] infozip: Add a host variant
In-Reply-To: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140403201610.7a819cf2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Wed,  2 Apr 2014 00:24:38 +0200, Maxime Hadjinlian wrote:
> +define HOST_INFOZIP_INSTALL_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \

You should have used HOST_CONFIGURE_OPTS here.

Committed with this fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
