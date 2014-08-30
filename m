From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Aug 2014 09:31:29 +0200
Subject: [Buildroot] [git commit branch/next] host-gdb: enable terminal
 user interface support
In-Reply-To: <20140830071153.50ADD9D59A@busybox.osuosl.org>
References: <20140830071153.50ADD9D59A@busybox.osuosl.org>
Message-ID: <20140830093129.0a86d2b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 30 Aug 2014 09:03:34 +0200, Peter Korsgaard wrote:

> +config BR2_PACKAGE_HOST_GDB_TUI
> +	bool "GDB TUI support"
> +	select BR2_PACKAGE_NCURSES

It seems like you didn't commit v2, because v2 was fixing this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
