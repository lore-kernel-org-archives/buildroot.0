From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:40:39 +0100
Subject: [Buildroot] [git commit] dtc: rename patches to new convention
Message-ID: <20150114194650.969898081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=304755acf59bf2fedd2b226314a089d54b65c729
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...stall.patch => 0001-separate-lib-install.patch} |    0
 ...-extra_cflags.patch => 0002-extra-cflags.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/dtc/dtc-separate-lib-install.patch b/package/dtc/0001-separate-lib-install.patch
similarity index 100%
rename from package/dtc/dtc-separate-lib-install.patch
rename to package/dtc/0001-separate-lib-install.patch
diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/0002-extra-cflags.patch
similarity index 100%
rename from package/dtc/dtc-extra_cflags.patch
rename to package/dtc/0002-extra-cflags.patch
