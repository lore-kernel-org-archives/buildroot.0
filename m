From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Nov 2020 09:39:57 +0100
Subject: [Buildroot] [git commit branch/next] package/oniguruma: security
 bump to version 6.9.6
Message-ID: <20201117203824.CFF6B86456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=969fe10855e2fbee623d545859a5209dea85534a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch (already in version)

Fixed many problems found by OSS-Fuzz
Fixed many problems found by Coverity

https://github.com/kkos/oniguruma/releases/tag/v6.9.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../oniguruma/0001-207-Out-of-bounds-write.patch   | 25 ----------------------
 package/oniguruma/oniguruma.hash                   |  2 +-
 package/oniguruma/oniguruma.mk                     |  5 +----
 3 files changed, 2 insertions(+), 30 deletions(-)

Patch is too large, so refusing to show it
