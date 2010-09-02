From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Sep 2010 12:24:55 +0200
Subject: [Buildroot] [PATCH 7/8] Re-implement the source-check and
 external-deps targets
In-Reply-To: <1283422191-30926-8-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
	<1283422191-30926-8-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <20100902122455.2c6ff0b4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> +	$(MAKE) DL_MODE=SOURCE_CHECK source

You lost $(EXTRAMAKEARGS) here.

> +	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS source

and here.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
