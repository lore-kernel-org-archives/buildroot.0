From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Wed, 7 Oct 2015 11:52:58 -0600
Subject: [Buildroot] [PATCH 1/2] Add PyQtGraph to the main package tree
In-Reply-To: <1444240379-22896-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1444240379-22896-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <1444240379-22896-2-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 3794f44..c8812a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -645,6 +645,7 @@ menu "external python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
+	source "package/python-pyqtgraph/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
-- 
1.7.10.4
