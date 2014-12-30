From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:19:14 +0100
Subject: [Buildroot] [git commit] ntp: fix hash file
Message-ID: <20141230235848.85032807DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a49bd36409f1d4b87dafc47a2432b718baeb0846
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a space between the hash and filename so the hash can be used.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 2ff6449..1d1b907 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,2 +1,2 @@
 # From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8.tar.gz.md5
-md5	6972a626be6150db8cfbd0b63d8719e7ntp-4.2.8.tar.gz
+md5	6972a626be6150db8cfbd0b63d8719e7 ntp-4.2.8.tar.gz
