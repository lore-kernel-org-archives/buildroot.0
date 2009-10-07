From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:51:18 +0200
Subject: [Buildroot] [PATCH 10/23] qt: don't enable internal
 tslib-module debugging
In-Reply-To: <1254907246-5650-11-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-11-git-send-email-mroth@nessie.de>
Message-ID: <20091007115118.65ea2dac@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:33 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> In Qt there are virtually hundreds of internal debug flags like
> TSLIBMOUSEHANDLER_DEBUG for every module or even C++ class. There
> is no reason to enable a single such flag when Qt is build with
> debugging symbols and others not.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

If needed in the future, we can add a "Extra Qt configure flags" option
if there is some need for it. In the mean time, fully agree.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
