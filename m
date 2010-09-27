From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Sep 2010 22:34:11 +0200
Subject: [Buildroot] [git commit master 1/1] packages: remove unneeded
	_INSTALL_TARGET_OPT definitions
Message-ID: <20100927203433.0E8098B6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=478ea1a12dffca0025c0ad55ad702cbaec465f93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that <pkg>_INSTALL_TARGET_OPT always defaults to
'DESTDIR=$(TARGET_DIR) install', we can remove the
<pkg>_INSTALL_TARGET_OPT definition from a lot of packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
