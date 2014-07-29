From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:11:27 +0200
Subject: [Buildroot] [git commit] popt: rename patch to use the correct
	naming convention
Message-ID: <20140729181200.7ECD29D297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1d31e237a8dd5738f9a55ccf8c44e7717136aaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch renames the popt patch popt-1.14_no-wchar.patch to
popt-01-no-wchar.patch in order to follow the naming convention used
in all packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-1.14_no-wchar.patch => popt-01-no-wchar.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/popt/popt-1.14_no-wchar.patch b/package/popt/popt-01-no-wchar.patch
similarity index 100%
rename from package/popt/popt-1.14_no-wchar.patch
rename to package/popt/popt-01-no-wchar.patch
