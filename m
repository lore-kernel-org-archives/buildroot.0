From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 10:52:42 +0000
Subject: [Buildroot] [PATCH] bwm-ng: add a hash file
Message-ID: <1418208762-59111-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It will clarify errors like this one:
  http://autobuild.buildroot.net/results/f22/f22888d87659dda8ff75f25490eab0a68f02bc9b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bwm-ng/bwm-ng.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/bwm-ng/bwm-ng.hash

diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
new file mode 100644
index 0000000..6bb8355
--- /dev/null
+++ b/package/bwm-ng/bwm-ng.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
-- 
1.7.1
