From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Thu,  5 Nov 2020 19:59:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump version to 2.6.0
Message-ID: <20201105185923.29022-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.hash | 4 ++--
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 751b0bdf6e..f64f1409d2 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  97504db65640570f32d3fdf701c25a340c8643037c3b69aec469c10c93dc8504   python-pybind-2.5.0.tar.gz
+sha256  90b705137b69ee3b5fc655eaca66d0dc9862ea1759226f7ccd3098425ae69571   python-pybind-2.6.0.tar.gz
 # License files, locally calculated
-sha256  9a37ea54aa3cf12c7f3292799f20822ffd4b9b7142b36a7a9997b28c39264dc9   LICENSE
+sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb   LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 634e869e40..435d4a9b50 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.5.0
+PYTHON_PYBIND_VERSION = 2.6.0
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.20.1
