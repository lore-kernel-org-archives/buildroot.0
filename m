From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:55 +0100
Subject: [Buildroot] [PATCH 23/26] package/acpitool: add hash for license
 file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-24-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/acpitool/acpitool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acpitool/acpitool.hash b/package/acpitool/acpitool.hash
index e25dc546f3..603127a719 100644
--- a/package/acpitool/acpitool.hash
+++ b/package/acpitool/acpitool.hash
@@ -1,2 +1,3 @@
 # locally computed hash
 sha256 004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f acpitool-0.5.1.tar.bz2
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.20.1
