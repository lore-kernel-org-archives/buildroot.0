From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:28 +0200
Subject: [Buildroot] [PATCH 08/34] perl-digest-hmac: add license hash
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-digest-hmac/perl-digest-hmac.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/perl-digest-hmac/perl-digest-hmac.hash b/package/perl-digest-hmac/perl-digest-hmac.hash
index 018e4eb0a..84bc86488 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.hash
+++ b/package/perl-digest-hmac/perl-digest-hmac.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    e6a5d6f552da16eacb5157ea4369ff9d Digest-HMAC-1.03.tar.gz
 sha256 3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59 Digest-HMAC-1.03.tar.gz
+
+# computed by scancpan
+sha256 56bf7cdaec5eebf74d58679638ebef5015883e65c1be7251a3ef8cce8bdd1ff5 README
-- 
2.17.1
