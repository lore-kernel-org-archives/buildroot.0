From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  2 Dec 2014 10:59:07 +0100
Subject: [Buildroot] [PATCH v4 09/14] qt5base: apply new patch naming policy
In-Reply-To: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
Message-ID: <1417514352-8825-10-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch}        | 0
 .../{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch}        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/qt5/qt5base/{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
 rename package/qt5/qt5base/{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} (100%)

diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/0002-mkspecs-files.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
rename to package/qt5/qt5base/0002-mkspecs-files.patch
diff --git a/package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch b/package/qt5/qt5base/0003-uclibc-no-lfs.patch
similarity index 100%
rename from package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
rename to package/qt5/qt5base/0003-uclibc-no-lfs.patch
-- 
1.9.1
