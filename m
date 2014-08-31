From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 22:26:18 +0200
Subject: [Buildroot] [git commit] package/yajl: add sequence number in patch
	names
Message-ID: <20140831214441.1BF8F9D330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a0dfea9c25edc09d4d404b4a6f939ecefdd63dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove the package version from the patch names.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-math-link.patch => yajl-0001-math-link.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/yajl/yajl-2.0.4-math-link.patch b/package/yajl/yajl-0001-math-link.patch
similarity index 100%
rename from package/yajl/yajl-2.0.4-math-link.patch
rename to package/yajl/yajl-0001-math-link.patch
