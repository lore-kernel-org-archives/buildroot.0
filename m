From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 13:06:44 +0200
Subject: [Buildroot] [PATCH 18/23] qt: remove Kconfig option to enable
 all pixel depths
In-Reply-To: <1254907246-5650-19-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-19-git-send-email-mroth@nessie.de>
Message-ID: <20091007130644.3745d736@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:41 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> The Kconfig menu "Pixel depths" of Qt provides a list with all
> selectable pixel depths and additionally the option "all".
> 
> When "all" is selected, the list with all available pixel depths
> disappears.
> 
> Because this disappearing of available pixel depths makes no sense
> under usability aspects, simply remove the option "all".
> 
> The user could enable all available pixel depths by selecting each
> individual depth anyway. So no functionality is lost.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
