From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:39 +0200
Subject: [Buildroot] [PATCH v1 19/28] package/python-idna: replace utf-8
 quote by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-19-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-idna/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
index 4ff4581d53..1fd56ceaf6 100644
--- a/package/python-idna/Config.in
+++ b/package/python-idna/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_IDNA
 	help
 	  A library to support the Internationalised Domain Names in
 	  Applications (IDNA) protocol as specified in RFC 5891. This
-	  version of the protocol is often referred to as ?IDNA2008?
+	  version of the protocol is often referred to as 'IDNA2008'
 	  and can produce different results from the earlier standard
 	  from 2003.

--
2.21.0
