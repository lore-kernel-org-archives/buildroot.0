From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 22 Jan 2020 23:28:53 +0100
Subject: [Buildroot] [git commit] package/acpitool: add hash for license file
Message-ID: <20200122222120.DFC7A83710@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=991544aed4072fddce555801eaf1cb83fac19d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Arnout: add space to existing hash to align them]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/acpitool/acpitool.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/acpitool/acpitool.hash b/package/acpitool/acpitool.hash
index e25dc546f3..b43bc374ca 100644
--- a/package/acpitool/acpitool.hash
+++ b/package/acpitool/acpitool.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f acpitool-0.5.1.tar.bz2
+sha256 004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f  acpitool-0.5.1.tar.bz2
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
