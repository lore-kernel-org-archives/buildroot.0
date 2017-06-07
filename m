From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 09:30:38 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] nodejs: re-add 6.x patches
Message-ID: <20170607073111.00EAB819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b68f9b145533672257ff75b42184f76c9f55f40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Commit 039f7d0d2f (nodejs: bump 6.x version to 6.10.2) bumped the 6.x
version but forgot to rename the patch directory, so the patches were no
longer used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nodejs/{6.9.4 => 6.10.2}/0001-gyp-force-link-command-to-use-CXX.patch | 0
 .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/nodejs/6.9.4/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.10.2/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.9.4/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.10.2/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.9.4/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.10.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.9.4/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.10.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
