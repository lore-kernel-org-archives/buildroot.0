From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jul 2012 23:27:49 +0200
Subject: [Buildroot] [PATCH v3] Bump gpsd from version 2.95 to version
 3.7
In-Reply-To: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
References: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120723232749.73ea8bca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jul 2012 20:29:36 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Applied, thanks.

I have just moved the HOST_SCONS definition out to the scons.mk file,
and named it just SCONS, just like we already have AUTOMAKE, AUTOCONF.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
