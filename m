From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 12 Jun 2015 08:00:44 +0200
Subject: [Buildroot] [PATCH 1/2] python-pyxml: rename the package file
Message-ID: <1434088845-2806-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/python-pyxml/{python-xml.hash => python-pyxml.hash} | 0
 package/python-pyxml/{python-xml.mk => python-pyxml.mk}     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/python-pyxml/{python-xml.hash => python-pyxml.hash} (100%)
 rename package/python-pyxml/{python-xml.mk => python-pyxml.mk} (100%)

diff --git a/package/python-pyxml/python-xml.hash b/package/python-pyxml/python-pyxml.hash
similarity index 100%
rename from package/python-pyxml/python-xml.hash
rename to package/python-pyxml/python-pyxml.hash
diff --git a/package/python-pyxml/python-xml.mk b/package/python-pyxml/python-pyxml.mk
similarity index 100%
rename from package/python-pyxml/python-xml.mk
rename to package/python-pyxml/python-pyxml.mk
-- 
1.9.1
