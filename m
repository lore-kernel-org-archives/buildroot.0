From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:34 +0200
Subject: [Buildroot] [PATCH 25/28] package/kvm-unit-tests: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-25-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kvm-unit-tests/kvm-unit-tests.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/kvm-unit-tests/kvm-unit-tests.hash

diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
new file mode 100644
index 000000000..b83e57de5
--- /dev/null
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 8cb85e5af51820dea8c250e1d4dac723de92c5cd8878354c6fa5c099975f3264  kvm-unit-tests-5731572b2ac23eb410732110b93425b5bb7f27dd.tar.gz
-- 
2.11.0
