From: Philippe Reynes <tremyfr@gmail.com>
Date: Sun, 15 Feb 2015 22:16:44 +0100
Subject: [Buildroot] [PATCH 3/3] [LINUX] 3.18: move to 3.18.7
In-Reply-To: <1424035004-19461-1-git-send-email-tremyfr@gmail.com>
References: <1424035004-19461-1-git-send-email-tremyfr@gmail.com>
Message-ID: <1424035004-19461-3-git-send-email-tremyfr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 ...nux-3.18.5.config => apf27-linux-3.18.7.config} |    0
 ...nux-3.18.5.config => apf28-linux-3.18.7.config} |    0
 ...nux-3.18.5.config => apf51-linux-3.18.7.config} |    0
 patches/linux/{3.18.5 => 3.18.7}                   |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename buildroot/target/device/armadeus/apf27/{apf27-linux-3.18.5.config => apf27-linux-3.18.7.config} (100%)
 rename buildroot/target/device/armadeus/apf28/{apf28-linux-3.18.5.config => apf28-linux-3.18.7.config} (100%)
 rename buildroot/target/device/armadeus/apf51/{apf51-linux-3.18.5.config => apf51-linux-3.18.7.config} (100%)
 rename patches/linux/{3.18.5 => 3.18.7} (100%)

diff --git a/buildroot/target/device/armadeus/apf27/apf27-linux-3.18.5.config b/buildroot/target/device/armadeus/apf27/apf27-linux-3.18.7.config
similarity index 100%
rename from buildroot/target/device/armadeus/apf27/apf27-linux-3.18.5.config
rename to buildroot/target/device/armadeus/apf27/apf27-linux-3.18.7.config
diff --git a/buildroot/target/device/armadeus/apf28/apf28-linux-3.18.5.config b/buildroot/target/device/armadeus/apf28/apf28-linux-3.18.7.config
similarity index 100%
rename from buildroot/target/device/armadeus/apf28/apf28-linux-3.18.5.config
rename to buildroot/target/device/armadeus/apf28/apf28-linux-3.18.7.config
diff --git a/buildroot/target/device/armadeus/apf51/apf51-linux-3.18.5.config b/buildroot/target/device/armadeus/apf51/apf51-linux-3.18.7.config
similarity index 100%
rename from buildroot/target/device/armadeus/apf51/apf51-linux-3.18.5.config
rename to buildroot/target/device/armadeus/apf51/apf51-linux-3.18.7.config
diff --git a/patches/linux/3.18.5 b/patches/linux/3.18.7
similarity index 100%
rename from patches/linux/3.18.5
rename to patches/linux/3.18.7
-- 
1.7.4.4
