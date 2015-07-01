From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 1 Jul 2015 12:05:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: init script for
 systemV-like init systems
In-Reply-To: <20150701111602.7b42bf45@free-electrons.com>
References: <1434485488-27833-1-git-send-email-petr.vorel@gmail.com>
 <20150701111602.7b42bf45@free-electrons.com>
Message-ID: <20150701100518.GC14363@vorel-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

> Can you use start-stop-daemon instead?

> > +define MODEM_MANAGER_INSTALL_INIT_SYSV
> > +$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager $(TARGET_DIR)/etc/init.d/S44modem-manager
> > +endef
> The command should be intended with one tab.
Sure, I'll correct it both.

> In the mean time, I'll mark your patch as Changes Requested in
> patchwork.
I suppose I can still post new version to mailing list.

Kind regards,
Petr
