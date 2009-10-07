From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:58:04 +0200
Subject: [Buildroot] [PATCH 13/23] qt: use configure option instead a
 sed hack to disable xinerama
In-Reply-To: <1254907246-5650-14-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-14-git-send-email-mroth@nessie.de>
Message-ID: <20091007115804.082ced52@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:36 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> The Qt configure script gained the option '-no-xinerama' in the
> meantime. So use it instead hacking the script itself using sed.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
