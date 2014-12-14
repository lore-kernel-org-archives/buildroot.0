From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Dec 2014 10:53:31 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/tvheadend: rename patches to new
	convention
In-Reply-To: <1418550811-15547-1-git-send-email-bernd.kuhls@t-online.de>
References: <1418550811-15547-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1418550811-15547-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial version

 ...{tvheadend-002-no-check_config.patch => 0001-no-check_config.patch} |    0
 .../{tvheadend-003-remove-werror.patch => 0002-remove-werror.patch}    |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/tvheadend/{tvheadend-002-no-check_config.patch => 0001-no-check_config.patch} (100%)
 rename package/tvheadend/{tvheadend-003-remove-werror.patch => 0002-remove-werror.patch} (100%)

diff --git a/package/tvheadend/tvheadend-002-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
similarity index 100%
rename from package/tvheadend/tvheadend-002-no-check_config.patch
rename to package/tvheadend/0001-no-check_config.patch
diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/0002-remove-werror.patch
similarity index 100%
rename from package/tvheadend/tvheadend-003-remove-werror.patch
rename to package/tvheadend/0002-remove-werror.patch
-- 
1.7.10.4
