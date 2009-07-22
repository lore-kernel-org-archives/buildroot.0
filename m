From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jul 2009 15:30:00 +0200
Subject: [Buildroot] [git commit] haserl: move 0.9.25 fix to subdir,
	so it isn't picked up by 0.8.0 build
Message-ID: <20090722133302.0AE7877703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3298fdae9f46feccf95268761dbdee0cbbf6c14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../haserl-0.9.25-array-vars-fix.patch             |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename package/haserl/{ => haserl-0.9.25}/haserl-0.9.25-array-vars-fix.patch (100%)

diff --git a/package/haserl/haserl-0.9.25-array-vars-fix.patch b/package/haserl/haserl-0.9.25/haserl-0.9.25-array-vars-fix.patch
similarity index 100%
rename from package/haserl/haserl-0.9.25-array-vars-fix.patch
rename to package/haserl/haserl-0.9.25/haserl-0.9.25-array-vars-fix.patch
-- 
1.6.3.3
