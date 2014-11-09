From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 21:45:46 +0100
Subject: [Buildroot] [git commit] quota: rename patch to the new convention
Message-ID: <20141109211319.A388CB3AAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0051046b4d73bd9e373393dc4cb9be155d7eb952
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As a preparation to the introduction of an additional patch to quota,
let's rename the existing patch to the new naming convention.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ynumber.patch => 01-tools-getrpcbynumber.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/quota/quota-01-tools-getrpcbynumber.patch b/package/quota/01-tools-getrpcbynumber.patch
similarity index 100%
rename from package/quota/quota-01-tools-getrpcbynumber.patch
rename to package/quota/01-tools-getrpcbynumber.patch
