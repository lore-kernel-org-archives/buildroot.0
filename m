From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 22 Jan 2020 23:24:17 +0100
Subject: [Buildroot] [git commit] package/bmon: add hash for license file
Message-ID: <20200122222120.771A083649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3da9e0a3fd98a1a8c9157e03c83452b334d74ce5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bmon/bmon.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
index dec0c7d81a..2cdf315a7f 100644
--- a/package/bmon/bmon.hash
+++ b/package/bmon/bmon.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256  02fdc312b8ceeb5786b28bf905f54328f414040ff42f45c83007f24b76cc9f7a  bmon-4.0.tar.gz
+sha256  59ae3d59c672bfb955917a8e32f5cacba7f8ce716c499a4c63dc8cd8cb5c4991  LICENSE.BSD
+sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSE.MIT
