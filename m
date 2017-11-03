From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:44 +0100
Subject: [Buildroot] [PATCH 09/31] package/clapack: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-10-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/clapack/clapack.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clapack/clapack.hash b/package/clapack/clapack.hash
index 08657fc594..350120d588 100644
--- a/package/clapack/clapack.hash
+++ b/package/clapack/clapack.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256 0b3f782bc24845d85f36bafbff0f2f1384dc72df730fda4e7924ec1a70baca5a clapack-3.2.1-CMAKE.tgz
+sha256 23014869214a231525b38c39fdb5f82364fa24154ac80fdcab2a79671460fd09 COPYING
+sha256 44561c447e91203ddc747beeca5cc2794d95ee982c17c578670e4f0408bc3904 F2CLIBS/libf2c/Notice
-- 
2.15.0
