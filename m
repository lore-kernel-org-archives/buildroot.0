From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 16 Sep 2014 18:44:25 +0200
Subject: [Buildroot] [PATCH v2] celt051: Fix file naming
Message-ID: <1410885865-24923-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to comply with naming policy, fix celt.mk filename.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
  - Sent with -M option

 package/celt051/{celt.mk => celt051.mk} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/celt051/{celt.mk => celt051.mk} (100%)

diff --git a/package/celt051/celt.mk b/package/celt051/celt051.mk
similarity index 100%
rename from package/celt051/celt.mk
rename to package/celt051/celt051.mk
-- 
2.1.0
