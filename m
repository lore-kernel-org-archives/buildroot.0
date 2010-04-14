From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 10:39:35 +0200
Subject: [Buildroot] [PATCH 02/41] ncurses: convert to autotools
	infrastructure
In-Reply-To: <87d3y2iiqz.fsf@macbook.be.48ers.dk>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
	<87d3y2iiqz.fsf@macbook.be.48ers.dk>
Message-ID: <s2p4d28d4b51004140139k128e6d6bnf5d0dd667a2d9c21@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 14, 2010 at 9:41 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "llandwerlin" == llandwerlin ?<llandwerlin@gmail.com> writes:
>
> ?llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
>
> ?llandwerlin> +
> ?llandwerlin> +define NCURSES_INSTALL_TARGET_CMDS
> ?llandwerlin> + mkdir -p $(TARGET_DIR)/usr/lib
> ?llandwerlin> + cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
> ?llandwerlin> + $(NCURSES_INSTALL_TARGET_PANEL)
> ?llandwerlin> + $(NCURSES_INSTALL_TARGET_FORM)
> ?llandwerlin> + $(BR2_PACKAGE_NCURSES_TARGET_MENU)
>
> Don't you mean NCURSES_INSTALL_TARGET_MENU here?
>

Exact, thx !
