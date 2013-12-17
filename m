From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Dec 2013 16:14:43 +0000
Subject: [Buildroot] [PATCH 1/2] blackbox: rename patches to add sequence
	numbers
Message-ID: <1387296884-27777-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...0.70.1-gcc43.patch => blackbox-002-gcc43.patch} |    0
 ... blackbox-003-gcc46-textpropertytostring.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/blackbox/{blackbox-0.70.1-gcc43.patch => blackbox-002-gcc43.patch} (100%)
 rename package/blackbox/{blackbox-0.70.1-gcc46-textpropertytostring.patch => blackbox-003-gcc46-textpropertytostring.patch} (100%)

diff --git a/package/blackbox/blackbox-0.70.1-gcc43.patch b/package/blackbox/blackbox-002-gcc43.patch
similarity index 100%
rename from package/blackbox/blackbox-0.70.1-gcc43.patch
rename to package/blackbox/blackbox-002-gcc43.patch
diff --git a/package/blackbox/blackbox-0.70.1-gcc46-textpropertytostring.patch b/package/blackbox/blackbox-003-gcc46-textpropertytostring.patch
similarity index 100%
rename from package/blackbox/blackbox-0.70.1-gcc46-textpropertytostring.patch
rename to package/blackbox/blackbox-003-gcc46-textpropertytostring.patch
-- 
1.7.1
