From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] correct name of xapp_xinput.mk
Message-ID: <20100408201137.DEDFD8B352@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=828f6a056e2f611f8febea8e94c8830805248ece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{xapp_xbacklight.mk => xapp_xinput.mk}         |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename package/x11r7/xapp_xinput/{xapp_xbacklight.mk => xapp_xinput.mk} (100%)

diff --git a/package/x11r7/xapp_xinput/xapp_xbacklight.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
similarity index 100%
rename from package/x11r7/xapp_xinput/xapp_xbacklight.mk
rename to package/x11r7/xapp_xinput/xapp_xinput.mk
-- 
1.6.3.3
