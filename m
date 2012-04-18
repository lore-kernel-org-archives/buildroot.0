From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 18 Apr 2012 13:29:23 +0200
Subject: [Buildroot] [PATCH 3/3] Fix qt samples dependency on QtGUI
In-Reply-To: <cover.1334748542.git.maxime.ripard@free-electrons.com>
References: <cover.1334748542.git.maxime.ripard@free-electrons.com>
Message-ID: <0e3d23b0b754d6c84b0e3a15653012c0b2d9d5bf.1334748542.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 1ce6348..88855d2 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install demos and examples (with code)"
+	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
 
-- 
1.7.5.4
