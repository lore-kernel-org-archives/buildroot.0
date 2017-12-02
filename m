From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:04:55 +0100
Subject: [Buildroot] [git commit] python-schedule: add missing hash type
Message-ID: <20171202131022.746F1801B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05ba727c6eebdd0eec919bd396fb73dd79a1b749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

./package/python-schedule/python-schedule.hash:5: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
./package/python-schedule/python-schedule.hash:5: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-schedule/python-schedule.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 9f64cc4..2b2f048 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -2,4 +2,4 @@
 md5	ab135a73458547d2b836beddd168528b  schedule-0.4.3.tar.gz
 sha256	31a160546a17838842199c792ba267575cf41339ca730aaf060567b798f4f46e  schedule-0.4.3.tar.gz
 # License file, locally calculated
-30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
+sha256	30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
