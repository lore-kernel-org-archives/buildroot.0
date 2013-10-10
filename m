From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:05:30 +0200
Subject: [Buildroot] [PATCH 3/9] package/wayland: install
 wayland-scanner to $(HOST)
In-Reply-To: <448f7432fc0b7c091413dd494e6b9d838cf51527.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <448f7432fc0b7c091413dd494e6b9d838cf51527.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <20131010090530.169e7a88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  9 Oct 2013 23:44:19 +0200, Yann E. MORIN wrote:
> +	 install -m 0755 -D wayland-scanner $(HOST_DIR)/usr/bin/wayland-scanner )

	$(INSTALL)

Also, that's nitpicking, but we generally don't have a space between
the end of the command and the closing parenthesis.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
