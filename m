From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:40:02 +0100
Subject: [Buildroot] [PATCH v3 2/7] dtc: rename patches to new convention
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <1421178007-11877-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../{dtc-separate-lib-install.patch => 0001-separate-lib-install.patch}   | 0
 package/dtc/{dtc-extra_cflags.patch => 0002-extra-cflags.patch}           | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/dtc/{dtc-separate-lib-install.patch => 0001-separate-lib-install.patch} (100%)
 rename package/dtc/{dtc-extra_cflags.patch => 0002-extra-cflags.patch} (100%)

diff --git a/package/dtc/dtc-separate-lib-install.patch b/package/dtc/0001-separate-lib-install.patch
similarity index 100%
rename from package/dtc/dtc-separate-lib-install.patch
rename to package/dtc/0001-separate-lib-install.patch
diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/0002-extra-cflags.patch
similarity index 100%
rename from package/dtc/dtc-extra_cflags.patch
rename to package/dtc/0002-extra-cflags.patch
-- 
2.1.2
