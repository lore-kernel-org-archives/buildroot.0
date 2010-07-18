From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 23:41:14 +0200
Subject: [Buildroot] [git commit master 1/1] neon: explicit path to
	xml2-config
Message-ID: <20100718214236.46568807FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4a2dabe9d53e6c361ecdeaba0431ef74a9ad297c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that $(STAGING_DIR)/usr/bin is not in the PATH, we need to
explicit the path to such tools.

This might also fix bug 1393 since by expliciting the path to
xml2-config, we'll force neon ./configure to choose our xml2-config
and not the one of the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
