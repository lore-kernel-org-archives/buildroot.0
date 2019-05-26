From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:26:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-idna:
 replace utf-8 quote by ascii single quote
Message-ID: <20190526072357.DF9F68E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcc7a1b82284602142e64ed10a62c1546945a7ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a83dab1e3e3804362fd01b4be9e9f857cb71b72b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-	  version of the protocol is often referred to as ???IDNA2008???
+	  version of the protocol is often referred to as 'IDNA2008'
 	  and can produce different results from the earlier standard
 	  from 2003.
 
