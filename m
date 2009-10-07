From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 13:05:50 +0200
Subject: [Buildroot] [PATCH 17/23] qt: add explicit Kconfig option to
 enable exceptions
In-Reply-To: <1254907246-5650-18-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-18-git-send-email-mroth@nessie.de>
Message-ID: <20091007130550.1218831d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:40 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Don't implicitly enable exceptions when the XML-Patterns-Modul is
> build, instead provide an separate entry in the Kconfig menu.

Is there a need to be able to explicitly enable/disable exceptions ?

I'm not against the patch, but I'm wondering if we really need to add
yet another Kconfig option for such a thing.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
