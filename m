From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 13:53:18 +0100
Subject: [Buildroot] [git commit] package/boost: fix space tabs
Message-ID: <20151212125355.E7D5A7F8C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e098cbe6e602b73af70a825c20c13f07f6c58db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index cffaf6e..97d0802 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -75,8 +75,8 @@ config BR2_PACKAGE_BOOST_CONTEXT
 			|| BR2_powerpc || BR2_x86_64)
 
 config BR2_PACKAGE_BOOST_COROUTINE
-        bool "boost-coroutine"
-        depends on BR2_PACKAGE_BOOST_CONTEXT
+	bool "boost-coroutine"
+	depends on BR2_PACKAGE_BOOST_CONTEXT
 
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
