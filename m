From: Michael Roth <mroth@nessie.de>
Date: Wed, 7 Oct 2009 12:35:01 +0200
Subject: [Buildroot] [PATCH 15/23] qt: make sure to install all Qt-fonts
	and true-type-fonts
In-Reply-To: <20091007120220.64ab7acb@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-16-git-send-email-mroth@nessie.de>
	<20091007120220.64ab7acb@surf>
Message-ID: <200910071235.06034.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wednesday 07 October 2009 12:02:20 schrieb Thomas Petazzoni:
> Even though this test:
>
> ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)
>
> is really segfaulting my brain.

Yes, I know. Ugly. I don't like it much, too. This should go away when
the whole Kconfig stuff for Qt gets reworked. But in the meantime...


Michael Roth
