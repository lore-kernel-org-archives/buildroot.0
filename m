From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 16:38:38 +0000
Subject: [Buildroot] [PATCH v2 1/4] elfutils: rename patches to follow the
	new name structure
In-Reply-To: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415637521-57583-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...isable-progs.patch => 0001-disable-progs.patch} |    0
 ...-argp-support.patch => 0002-argp-support.patch} |    0
 ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |    0
 .../{elfutils-04-fts.patch => 0004-fts.patch}      |    0
 ...s-05-disable-po.patch => 0005-disable-po.patch} |    0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (100%)
 rename package/elfutils/{elfutils-02-argp-support.patch => 0002-argp-support.patch} (100%)
 rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (100%)
 rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (100%)
 rename package/elfutils/{elfutils-05-disable-po.patch => 0005-disable-po.patch} (100%)

diff --git a/package/elfutils/elfutils-01-disable-progs.patch b/package/elfutils/0001-disable-progs.patch
similarity index 100%
rename from package/elfutils/elfutils-01-disable-progs.patch
rename to package/elfutils/0001-disable-progs.patch
diff --git a/package/elfutils/elfutils-02-argp-support.patch b/package/elfutils/0002-argp-support.patch
similarity index 100%
rename from package/elfutils/elfutils-02-argp-support.patch
rename to package/elfutils/0002-argp-support.patch
diff --git a/package/elfutils/elfutils-03-memcpy-def.patch b/package/elfutils/0003-memcpy-def.patch
similarity index 100%
rename from package/elfutils/elfutils-03-memcpy-def.patch
rename to package/elfutils/0003-memcpy-def.patch
diff --git a/package/elfutils/elfutils-04-fts.patch b/package/elfutils/0004-fts.patch
similarity index 100%
rename from package/elfutils/elfutils-04-fts.patch
rename to package/elfutils/0004-fts.patch
diff --git a/package/elfutils/elfutils-05-disable-po.patch b/package/elfutils/0005-disable-po.patch
similarity index 100%
rename from package/elfutils/elfutils-05-disable-po.patch
rename to package/elfutils/0005-disable-po.patch
-- 
1.7.1
