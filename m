From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 10:56:45 -0700
Subject: [Buildroot] [RFC PATCH 2/2] perl-xml-parser: new package
In-Reply-To: <20180813175645.11088-1-chrismcc@gmail.com>
References: <20180813175645.11088-1-chrismcc@gmail.com>
Message-ID: <20180813175645.11088-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS        | 1 +
 package/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d35cf3fb72..8cd71c0cfd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -502,6 +502,7 @@ F:	package/perl-sub-install/
 F:	package/perl-sys-meminfo/
 F:	package/perl-sys-mmap/
 F:	package/perl-template-toolkit/
+F:	package/perl-xml-parser/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 6437cc0451..a83015a819 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -736,6 +736,7 @@ menu "Perl libraries/modules"
 	source "package/perl-www-robotrules/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
+	source "package/perl-xml-parser/Config.in"
 	source "package/perl-xml-sax/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
 endmenu
-- 
2.14.4
