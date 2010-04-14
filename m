From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 09:41:08 +0200
Subject: [Buildroot] [PATCH 02/41] ncurses: convert to autotools
	infrastructure
In-Reply-To: <1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:05:35 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <87d3y2iiqz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>

 llandwerlin> +
 llandwerlin> +define NCURSES_INSTALL_TARGET_CMDS
 llandwerlin> +	mkdir -p $(TARGET_DIR)/usr/lib
 llandwerlin> +	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
 llandwerlin> +	$(NCURSES_INSTALL_TARGET_PANEL)
 llandwerlin> +	$(NCURSES_INSTALL_TARGET_FORM)
 llandwerlin> +	$(BR2_PACKAGE_NCURSES_TARGET_MENU)

Don't you mean NCURSES_INSTALL_TARGET_MENU here?

-- 
Bye, Peter Korsgaard
