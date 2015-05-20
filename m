From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 20 May 2015 09:41:49 +0200
Subject: [Buildroot] [PATCH 2/3] package/luajit: renumber patches
In-Reply-To: <1432107710-3982-1-git-send-email-joerg.krause@embedded.rocks>
References: <1432107710-3982-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1432107710-3982-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luajit/{0004-no-bin-symlink.patch => 0001-no-bin-symlink.patch} | 0
 package/luajit/{0005-install-inc.patch => 0002-install-inc.patch}       | 0
 package/luajit/{0006-install-so.patch => 0003-install-so.patch}         | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/luajit/{0004-no-bin-symlink.patch => 0001-no-bin-symlink.patch} (100%)
 rename package/luajit/{0005-install-inc.patch => 0002-install-inc.patch} (100%)
 rename package/luajit/{0006-install-so.patch => 0003-install-so.patch} (100%)

diff --git a/package/luajit/0004-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
similarity index 100%
rename from package/luajit/0004-no-bin-symlink.patch
rename to package/luajit/0001-no-bin-symlink.patch
diff --git a/package/luajit/0005-install-inc.patch b/package/luajit/0002-install-inc.patch
similarity index 100%
rename from package/luajit/0005-install-inc.patch
rename to package/luajit/0002-install-inc.patch
diff --git a/package/luajit/0006-install-so.patch b/package/luajit/0003-install-so.patch
similarity index 100%
rename from package/luajit/0006-install-so.patch
rename to package/luajit/0003-install-so.patch
-- 
2.4.1
