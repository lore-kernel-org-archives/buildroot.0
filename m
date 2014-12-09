From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue,  9 Dec 2014 08:04:13 -0800
Subject: [Buildroot] [PATCH 1/1] iptables: rename patches to new convention
Message-ID: <1418141053-6060-1-git-send-email-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 .../{iptables-01-fix-static-link.patch => 0001-fix-static-link.patch}     | 0
 ...atch => 0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/iptables/{iptables-01-fix-static-link.patch => 0001-fix-static-link.patch} (100%)
 rename package/iptables/{iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch => 0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch} (100%)

diff --git a/package/iptables/iptables-01-fix-static-link.patch b/package/iptables/0001-fix-static-link.patch
similarity index 100%
rename from package/iptables/iptables-01-fix-static-link.patch
rename to package/iptables/0001-fix-static-link.patch
diff --git a/package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch b/package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
similarity index 100%
rename from package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
rename to package/iptables/0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
-- 
2.2.0
