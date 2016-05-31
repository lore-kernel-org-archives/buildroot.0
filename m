From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 09:14:02 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix typo in
	wayland configure option
In-Reply-To: <1464676832-13862-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Tue, 31 May 2016 08:40:32 +0200")
References: <1464676832-13862-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <874m9e1yyt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Bug was introduced in
 > https://git.busybox.net/buildroot/commit/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk?id=1370fcaeb7c88e958a967594596769c71a4526f9

 > The configure option is called --en-/disable-xwayland:
 > https://cgit.freedesktop.org/xorg/xserver/tree/configure.ac?id=9454cd51da9b38b974cff7c8b7125901f6403848#n630

 > Fixes
 > http://autobuild.buildroot.net/results/c32/c32a17509b070b1af497bfc54b85a944fa59ca30/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
