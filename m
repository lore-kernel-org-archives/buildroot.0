From: Youssef at smile.fr <Youssef@smile.fr>
Date: Thu, 11 Apr 2019 17:58:05 +0200
Subject: [Buildroot] [PATCH v3 2/2]   Generating the .gitlab-ci.yml file
In-Reply-To: <20190411155805.4111-1-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
References: <20190411155805.4111-1-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
Message-ID: <20190411155805.4111-2-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: youssef <youssef.harmouch@smile.fr>

  Signed-off-by: youssef <youssef.harmouch@smile.fr>
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
