From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 May 2013 13:57:09 +0200
Subject: [Buildroot] [PATCH 1/3] libglib2: rename patches
Message-ID: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...t.patch => libglib2-0001-make-codegen-python2-python3-compliant.patch} | 0
 .../libglib2/{libglib2-no-tests.patch => libglib2-0002-no-tests.patch}    | 0
 .../{libglib2-optional-ipv6.patch => libglib2-0003-optional-ipv6.patch}   | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libglib2/{libglib2-make-codegen-python2-python3-compliant.patch => libglib2-0001-make-codegen-python2-python3-compliant.patch} (100%)
 rename package/libglib2/{libglib2-no-tests.patch => libglib2-0002-no-tests.patch} (100%)
 rename package/libglib2/{libglib2-optional-ipv6.patch => libglib2-0003-optional-ipv6.patch} (100%)

diff --git a/package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch b/package/libglib2/libglib2-0001-make-codegen-python2-python3-compliant.patch
similarity index 100%
rename from package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
rename to package/libglib2/libglib2-0001-make-codegen-python2-python3-compliant.patch
diff --git a/package/libglib2/libglib2-no-tests.patch b/package/libglib2/libglib2-0002-no-tests.patch
similarity index 100%
rename from package/libglib2/libglib2-no-tests.patch
rename to package/libglib2/libglib2-0002-no-tests.patch
diff --git a/package/libglib2/libglib2-optional-ipv6.patch b/package/libglib2/libglib2-0003-optional-ipv6.patch
similarity index 100%
rename from package/libglib2/libglib2-optional-ipv6.patch
rename to package/libglib2/libglib2-0003-optional-ipv6.patch
-- 
1.8.2.3
