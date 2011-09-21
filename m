From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:42:11 +0200
Subject: [Buildroot] [PATCH 0 of 3] gentargets: add scp and Mercurial
	download helpers
Message-ID: <patchbomb.1316587331@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds download methods for scp and Mercurial, and updates
the documentation (including some typo fixes)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                   |  12 ++++++++++++
 docs/buildroot.html         |  29 +++++++++++++++++------------
 package/Makefile.package.in |  62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 17 deletions(-)
