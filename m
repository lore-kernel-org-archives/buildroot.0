From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 19:23:00 +0100
Subject: [Buildroot] [git commit] system/skeleton: drop shutdown user from
	shadow
Message-ID: <20141027182313.950DCB169B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7dec51ebe86b52fecf1059e7263499c7e6d14ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has no counterpart in passwd so it's basically a NOP.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/shadow |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
index 69ab451..3cd1649 100644
--- a/system/skeleton/etc/shadow
+++ b/system/skeleton/etc/shadow
@@ -3,7 +3,6 @@ bin:*:10933:0:99999:7:::
 daemon:*:10933:0:99999:7:::
 lp:*:10933:0:99999:7:::
 sync:*:10933:0:99999:7:::
-shutdown:*:10933:0:99999:7:::
 halt:*:10933:0:99999:7:::
 uucp:*:10933:0:99999:7:::
 operator:*:10933:0:99999:7:::
