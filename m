From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:14:54 +0200
Subject: [Buildroot] [git commit] package/transmission: remove
 BR2_PACKAGE_TRANSMISSION_REMOTE
In-Reply-To: <20180520134322.84EE081320@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 20 May 2018 15:38:46 +0200")
References: <20180520134322.84EE081320@busybox.osuosl.org>
Message-ID: <87k1r59ga9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=79a678d7745bc3f3b5f361a7e3f25f39c3f1568b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 6e223241e1bb58a27eb890291f9f5c1fcc6a0818 ("Add Transmission
 > package"), which added the transmission package, introduced a
 > BR2_PACKAGE_TRANSMISSION_REMOTE Config.in option, supposedly matching
 > the --enable-remote/--disable-remote transmission option.

 > However, transmission as of version 2.33 packaged by this initial
 > commit, did not have a --enable-remote/--disable-remote option, and it
 > was apparently never part of transmission.

 > Therefore, this commit removes this useless option. Since the
 > transmission-remote tool is automatically built when the daemon is
 > enabled, the Config.in.legacy handling selects
 > BR2_PACKAGE_TRANSMISSION_DAEMON.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
