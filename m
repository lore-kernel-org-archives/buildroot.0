From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 13:31:51 +0100
Subject: [Buildroot] [git commit] package/nginx: rename patch to new
	convention
Message-ID: <20141203123322.1F6B57FFA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed961f1128b7495616d70681253070bfda9ebc9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...zeof-rework-autotest-to-be-cross-compila.patch} |    0
 ...-add-mechanism-allowing-to-force-feature.patch} |    0
 ..._feature_run_force_result-for-each-featu.patch} |    0
 ...xslt-conf-allow-to-override-ngx_feature_.patch} |    0
 ...ix-make-sys_nerr-guessing-cross-friendly.patch} |    0
 5 files changed, 0 insertions(+), 0 deletions(-)

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
