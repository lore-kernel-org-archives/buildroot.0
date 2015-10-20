From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:24:45 +0200
Subject: [Buildroot] [git commit] dhcpdump: add a hash file
Message-ID: <20151020203207.F0FFA7FB94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b90ce5454e2b68df0c38af81afaefb7af6a1bf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpdump/dhcpdump.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
new file mode 100644
index 0000000..36040c8
--- /dev/null
+++ b/package/dhcpdump/dhcpdump.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
