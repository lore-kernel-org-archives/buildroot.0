From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:04:24 +0100
Subject: [Buildroot] [git commit] iptables: rename patches to new convention
Message-ID: <20141209180434.9E16380191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19dd56dbaa67dca49e3a129186d7c43850858700
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tatic-link.patch => 0001-fix-static-link.patch} |    0
 ...p-6-tables-save.c-remove-dlfcn.h-include.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/iptables/iptables-01-fix-static-link.patch b/package/iptables/0001-fix-static-link.patch
similarity index 100%
rename from package/iptables/iptables-01-fix-static-link.patch
rename to package/iptables/0001-fix-static-link.patch
diff --git a/package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch b/package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
similarity index 100%
rename from package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
rename to package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
