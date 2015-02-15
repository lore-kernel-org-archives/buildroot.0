From: Philippe Reynes <tremyfr@gmail.com>
Date: Sun, 15 Feb 2015 22:16:43 +0100
Subject: [Buildroot] [PATCH 2/3] [LINUX] 3.14: move to 3.14.33
In-Reply-To: <1424035004-19461-1-git-send-email-tremyfr@gmail.com>
References: <1424035004-19461-1-git-send-email-tremyfr@gmail.com>
Message-ID: <1424035004-19461-2-git-send-email-tremyfr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 ...x-3.14.31.config => apf27-linux-3.14.33.config} |    0
 ...x-3.14.31.config => apf28-linux-3.14.33.config} |    0
 ...x-3.14.31.config => apf51-linux-3.14.33.config} |    0
 patches/linux/{3.14.31 => 3.14.33}                 |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename buildroot/target/device/armadeus/apf27/{apf27-linux-3.14.31.config => apf27-linux-3.14.33.config} (100%)
 rename buildroot/target/device/armadeus/apf28/{apf28-linux-3.14.31.config => apf28-linux-3.14.33.config} (100%)
 rename buildroot/target/device/armadeus/apf51/{apf51-linux-3.14.31.config => apf51-linux-3.14.33.config} (100%)
 rename patches/linux/{3.14.31 => 3.14.33} (100%)

diff --git a/buildroot/target/device/armadeus/apf27/apf27-linux-3.14.31.config b/buildroot/target/device/armadeus/apf27/apf27-linux-3.14.33.config
similarity index 100%
rename from buildroot/target/device/armadeus/apf27/apf27-linux-3.14.31.config
rename to buildroot/target/device/armadeus/apf27/apf27-linux-3.14.33.config
diff --git a/buildroot/target/device/armadeus/apf28/apf28-linux-3.14.31.config b/buildroot/target/device/armadeus/apf28/apf28-linux-3.14.33.config
similarity index 100%
rename from buildroot/target/device/armadeus/apf28/apf28-linux-3.14.31.config
rename to buildroot/target/device/armadeus/apf28/apf28-linux-3.14.33.config
diff --git a/buildroot/target/device/armadeus/apf51/apf51-linux-3.14.31.config b/buildroot/target/device/armadeus/apf51/apf51-linux-3.14.33.config
similarity index 100%
rename from buildroot/target/device/armadeus/apf51/apf51-linux-3.14.31.config
rename to buildroot/target/device/armadeus/apf51/apf51-linux-3.14.33.config
diff --git a/patches/linux/3.14.31 b/patches/linux/3.14.33
similarity index 100%
rename from patches/linux/3.14.31
rename to patches/linux/3.14.33
-- 
1.7.4.4
