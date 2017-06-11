From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:29 +0200
Subject: [Buildroot] [git commit] package/kvm-unit-tests: add hash
Message-ID: <20170611123755.33B22805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5080edec92334ae08ff96dfd57bdc6db6a681a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/kvm-unit-tests.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
new file mode 100644
index 0000000..b83e57d
--- /dev/null
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 8cb85e5af51820dea8c250e1d4dac723de92c5cd8878354c6fa5c099975f3264  kvm-unit-tests-5731572b2ac23eb410732110b93425b5bb7f27dd.tar.gz
