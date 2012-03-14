From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Mar 2012 20:41:24 +0100
Subject: [Buildroot] [git commit] libxml2: ensure patches are applied in the
	correct order
Message-ID: <20120314220941.EE69F90D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b772b2f417112e6e12ba6a2eb05ebb8250fdc9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of the patches depends on eachother, so rename them to ensure they
get applied in the correct order.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...xml2-0-allocation-error-copying-entities.patch} |    0
 ...patch => libxml2-1-reallocation-failures.patch} |    0
 ...on.patch => libxml2-2-hash-randomization.patch} |    0
 ...h-memory.patch => libxml2-3-xpath-memory.patch} |    0
 ...freeing.patch => libxml2-4-xpath-freeing.patch} |    0
 ...eeing2.patch => libxml2-5-xpath-freeing2.patch} |    0
 ...xpath.patch => libxml2-6-hardening-xpath.patch} |    0
 ...ror-xpath.patch => libxml2-7-error-xpath.patch} |    0
 8 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2-2.7.8-allocation-error-copying-entities.patch b/package/libxml2/libxml2-0-allocation-error-copying-entities.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-allocation-error-copying-entities.patch
rename to package/libxml2/libxml2-0-allocation-error-copying-entities.patch
diff --git a/package/libxml2/libxml2-2.7.8-reallocation-failures.patch b/package/libxml2/libxml2-1-reallocation-failures.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-reallocation-failures.patch
rename to package/libxml2/libxml2-1-reallocation-failures.patch
diff --git a/package/libxml2/libxml2-2.7.8-hash-randomization.patch b/package/libxml2/libxml2-2-hash-randomization.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-hash-randomization.patch
rename to package/libxml2/libxml2-2-hash-randomization.patch
diff --git a/package/libxml2/libxml2-2.7.8-xpath-memory.patch b/package/libxml2/libxml2-3-xpath-memory.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-xpath-memory.patch
rename to package/libxml2/libxml2-3-xpath-memory.patch
diff --git a/package/libxml2/libxml2-2.7.8-xpath-freeing.patch b/package/libxml2/libxml2-4-xpath-freeing.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-xpath-freeing.patch
rename to package/libxml2/libxml2-4-xpath-freeing.patch
diff --git a/package/libxml2/libxml2-2.7.8-xpath-freeing2.patch b/package/libxml2/libxml2-5-xpath-freeing2.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-xpath-freeing2.patch
rename to package/libxml2/libxml2-5-xpath-freeing2.patch
diff --git a/package/libxml2/libxml2-2.7.8-hardening-xpath.patch b/package/libxml2/libxml2-6-hardening-xpath.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-hardening-xpath.patch
rename to package/libxml2/libxml2-6-hardening-xpath.patch
diff --git a/package/libxml2/libxml2-2.7.8-error-xpath.patch b/package/libxml2/libxml2-7-error-xpath.patch
similarity index 100%
rename from package/libxml2/libxml2-2.7.8-error-xpath.patch
rename to package/libxml2/libxml2-7-error-xpath.patch
