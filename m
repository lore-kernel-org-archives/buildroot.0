From: youssef <youssef.harmouch@smile.fr>
Date: Wed, 10 Apr 2019 11:36:06 +0200
Subject: [Buildroot] [PATCH v3 2/2]   Generating the .gitlab-ci.yml file
Message-ID: <20190410093607.4050-1-youssef.harmouch@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 572868a557..84e2190bb7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -325,6 +325,7 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: { extends: .runtime_tes
 tests.package.test_atop.TestAtop: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
+tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
-- 
2.17.1
