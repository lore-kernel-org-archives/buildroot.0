From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:15 +0200
Subject: [Buildroot] [PATCH v2 2/9] package/yajl: add sequence number in
	patch names
In-Reply-To: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409514922-9509-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove the package version from the patch names.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- new patch
---
 package/yajl/{yajl-2.0.4-math-link.patch => yajl-0001-math-link.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/yajl/{yajl-2.0.4-math-link.patch => yajl-0001-math-link.patch} (100%)

diff --git a/package/yajl/yajl-2.0.4-math-link.patch b/package/yajl/yajl-0001-math-link.patch
similarity index 100%
rename from package/yajl/yajl-2.0.4-math-link.patch
rename to package/yajl/yajl-0001-math-link.patch
-- 
2.1.0
