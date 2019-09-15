From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 15 Sep 2019 12:35:56 -0700
Subject: [Buildroot] [PATCH 2/5] package/mariadb: add bug tracker link to
 existing patch
In-Reply-To: <20190915193559.8464-1-bluemrp9@gmail.com>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
Message-ID: <20190915193559.8464-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/0001-add-extra-check-for-librt.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
index 26bff7546c..90aa626a0b 100644
--- a/package/mariadb/0001-add-extra-check-for-librt.patch
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -3,6 +3,8 @@ From: Ryan Coe <bluemrp9@gmail.com>
 Date: Thu, 27 Oct 2016 20:33:21 -0700
 Subject: [PATCH] add extra check for librt
 
+https://jira.mariadb.org/browse/MDEV-10841
+
 Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 ---
  configure.cmake | 3 +++
-- 
2.17.1
