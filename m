From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 21 Oct 2020 18:50:04 +0200
Subject: [Buildroot] [PATCH v2 4/4] DEVELOPERS: Add myself for grpc and
 dependencies
In-Reply-To: <20201021165005.641-1-buildroot@heine.tech>
References: <20201021165005.641-1-buildroot@heine.tech>
Message-ID: <20201021165005.641-4-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

v1 -> v2:
 - googletest is called gtest in BR

---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b245c1cd7e..e73295e8a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1850,6 +1850,10 @@ F:	package/gnuplot/
 F:	package/sdl2/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
+F:	package/grpc/
+F:	package/gtest/
+F:	package/libabseil-cpp/
+F:	package/protobuf/
 F:	package/re2/
 
 N:	Michael Rommel <rommel@layer-7.net>
-- 
2.25.1
