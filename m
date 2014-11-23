From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Nov 2014 18:19:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: rename patch to new
	convention
Message-ID: <1416763150-28951-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ch => 0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch} | 0
 ...ch => 0002-auto-feature-add-mechanism-allowing-to-force-feature.patch} | 0
 ...ch => 0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch} | 0
 ...ch => 0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch} | 0
 ...y.patch => 0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch} | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename package/nginx/{nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch => 0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch} (100%)
 rename package/nginx/{nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch => 0002-auto-feature-add-mechanism-allowing-to-force-feature.patch} (100%)
 rename package/nginx/{nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch => 0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch} (100%)
 rename package/nginx/{nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch => 0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch} (100%)
 rename package/nginx/{nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch => 0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch} (100%)

diff --git a/package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
similarity index 100%
rename from package/nginx/nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
rename to package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
diff --git a/package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch b/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
similarity index 100%
rename from package/nginx/nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
rename to package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
diff --git a/package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
similarity index 100%
rename from package/nginx/nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
rename to package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
diff --git a/package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch b/package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
similarity index 100%
rename from package/nginx/nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
rename to package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
diff --git a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
similarity index 100%
rename from package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
rename to package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
-- 
2.1.3
