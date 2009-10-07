From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 13:17:48 +0200
Subject: [Buildroot] [PATCH 22/23] qt: group qstrip macro calls together
In-Reply-To: <1254907246-5650-23-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-23-git-send-email-mroth@nessie.de>
Message-ID: <20091007131748.24406f07@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:45 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> For the sake of beauty group the calls to qstrip together and assign
> the result to new variables.
> 
> Additionally while we are here remove some excessive newlines.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
