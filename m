From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  8 Jan 2017 23:42:44 +0100
Subject: [Buildroot] [PATCH 1/2] nodejs: re-add 6.x patches
Message-ID: <20170108224245.17612-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3fd9c062e (nodejs: bump to version 6.9.2) bumped the 6.x version but
forgot to rename the patch directory, so the patches were no longer used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nodejs/{6.9.1 => 6.9.2}/0001-gyp-force-link-command-to-use-CXX.patch  | 0
 .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/nodejs/{6.9.1 => 6.9.2}/0001-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{6.9.1 => 6.9.2}/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch (100%)

diff --git a/package/nodejs/6.9.1/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.9.2/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.9.1/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.9.2/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.9.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.9.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.9.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.9.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
-- 
2.11.0
