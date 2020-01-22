From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 22 Jan 2020 23:28:05 +0100
Subject: [Buildroot] [git commit] package/dieharder: add hash for license
 file
Message-ID: <20200122222120.D0BD283649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfaa085af6318628bc7bcf7335adbeed6e2b3445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Arnout: add space to existing hash to align them]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dieharder/dieharder.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
index eefe4b71de..55932ce6af 100644
--- a/package/dieharder/dieharder.hash
+++ b/package/dieharder/dieharder.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f dieharder-3.31.1.tgz
+sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f  dieharder-3.31.1.tgz
+sha256 c475bcd1afa6fc15a65174e31c599c0d23706a34e4b9f2fcb03a4dad5438d53f  COPYING
