From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 09:59:00 +0000
Subject: [Buildroot] [PATCH] boa: add a hash file
Message-ID: <1418378340-40737-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It will clarify errors like this one:
  http://autobuild.buildroot.net/results/b71/b71084d67d33e80cde9478dcf5a89511479cb95e/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/boa/boa.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/boa/boa.hash

diff --git a/package/boa/boa.hash b/package/boa/boa.hash
new file mode 100644
index 0000000..37760fd
--- /dev/null
+++ b/package/boa/boa.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  02c51bf25f29d56e641b662f0767759654c28d88ec31f55c5a73d57edfe13cf6  boa-0.94.14rc21.tar.gz
-- 
1.7.1
