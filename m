From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Mar 2017 15:50:37 +0100
Subject: [Buildroot] [git commit] libvdpau: source files should not be
	executable
Message-ID: <20170320145108.3BD8B825FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f048b0c356898e6b79e461bb3f6deef98ff64eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvdpau/0001-missing-configh-include.patch | 0
 package/libvdpau/0002-link-with-libx11.patch        | 0
 package/libvdpau/0003-vdpau-module-searchpath.patch | 0
 package/libvdpau/Config.in                          | 0
 package/libvdpau/libvdpau.hash                      | 0
 package/libvdpau/libvdpau.mk                        | 0
 6 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libvdpau/0001-missing-configh-include.patch b/package/libvdpau/0001-missing-configh-include.patch
old mode 100755
new mode 100644
diff --git a/package/libvdpau/0002-link-with-libx11.patch b/package/libvdpau/0002-link-with-libx11.patch
old mode 100755
new mode 100644
diff --git a/package/libvdpau/0003-vdpau-module-searchpath.patch b/package/libvdpau/0003-vdpau-module-searchpath.patch
old mode 100755
new mode 100644
diff --git a/package/libvdpau/Config.in b/package/libvdpau/Config.in
old mode 100755
new mode 100644
diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
old mode 100755
new mode 100644
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
old mode 100755
new mode 100644
