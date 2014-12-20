From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 21 Dec 2014 00:50:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/perl-gd: rename patches to follow
	the new name convention
Message-ID: <1419119460-1437-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/perl-gd/{perl-gd-01-getoptions.patch => 0001-getoptions.patch} | 0
 package/perl-gd/{perl-gd-02-lgd.patch => 0002-lgd.patch}               | 0
 package/perl-gd/{perl-gd-03-force.patch => 0003-force.patch}           | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/perl-gd/{perl-gd-01-getoptions.patch => 0001-getoptions.patch} (100%)
 rename package/perl-gd/{perl-gd-02-lgd.patch => 0002-lgd.patch} (100%)
 rename package/perl-gd/{perl-gd-03-force.patch => 0003-force.patch} (100%)

diff --git a/package/perl-gd/perl-gd-01-getoptions.patch b/package/perl-gd/0001-getoptions.patch
similarity index 100%
rename from package/perl-gd/perl-gd-01-getoptions.patch
rename to package/perl-gd/0001-getoptions.patch
diff --git a/package/perl-gd/perl-gd-02-lgd.patch b/package/perl-gd/0002-lgd.patch
similarity index 100%
rename from package/perl-gd/perl-gd-02-lgd.patch
rename to package/perl-gd/0002-lgd.patch
diff --git a/package/perl-gd/perl-gd-03-force.patch b/package/perl-gd/0003-force.patch
similarity index 100%
rename from package/perl-gd/perl-gd-03-force.patch
rename to package/perl-gd/0003-force.patch
-- 
1.9.3
