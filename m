From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 22:50:35 +0200
Subject: [Buildroot] [PATCH v2 3/5] go: add self to developers to get cc-ed
 for build failures
In-Reply-To: <20180511205037.10078-1-anisse@astier.eu>
References: <20180511205037.10078-1-anisse@astier.eu>
Message-ID: <20180511205037.10078-4-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b910a86a8c..dabea65b03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -153,6 +153,9 @@ F:	package/python-pydal/
 F:	package/python-web2py/
 F:	package/sysdig/
 
+N:	Anisse Astier <anisse@astier.eu>
+F:	package/go/
+
 N:	Antony Pavlov <antonynpavlov@gmail.com>
 F:	package/lsscsi/
 
-- 
2.14.3
