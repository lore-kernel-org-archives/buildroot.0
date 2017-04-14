From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 10:59:41 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170414105941.151a95d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 22:20:47 -0500, Matt Weber wrote:

> +define BUSYBOX_NCURSE_PROGS_TWEAKS

I've changed the name of this variable to:

	BUSYBOX_DISABLE_NCURSES_PROGS

and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
