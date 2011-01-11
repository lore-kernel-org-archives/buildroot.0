From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 16:46:00 +0100
Subject: [Buildroot] [git commit master 1/1] target skeleton: add audio group
Message-ID: <20110111154614.EC49B8A3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8497c46a57e740cb9d236cae2c2a4cc4d9962a23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add audio group to the target skeleton.
Some multimedia applications based on alsa-lib need it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index c600be0..df12dba 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -6,6 +6,7 @@ adm:x:4:
 tty:x:5:
 disk:x:6:
 wheel:x:10:root
+audio:x:29:
 utmp:x:43:
 staff:x:50:
 haldaemon:x:68:
-- 
1.7.2.2
