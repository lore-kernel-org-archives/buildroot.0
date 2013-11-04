From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 21:55:54 +0100
Subject: [Buildroot] [git commit] libcap: rename existing patch
Message-ID: <20131104211055.3DE229BC9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bea7b8c381fa7c62f40f63f9e9f80e530fa9f3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap currently has one patch, but it is named using the old naming
strategy, which includes the package version, but not a patch
number. This commit switches this to use the new patch naming
strategy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 ...d-system.patch => libcap-01-build-system.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libcap/libcap-2.22-build-system.patch b/package/libcap/libcap-01-build-system.patch
similarity index 100%
rename from package/libcap/libcap-2.22-build-system.patch
rename to package/libcap/libcap-01-build-system.patch
