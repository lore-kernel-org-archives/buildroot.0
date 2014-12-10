From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:22:21 +0100
Subject: [Buildroot] [git commit] bwm-ng: add a hash file
Message-ID: <20141210202233.1245E801CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83b0d8f821a972aa85d003ab1b750dc8e184fe9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will clarify errors like this one:
  http://autobuild.buildroot.net/results/f22/f22888d87659dda8ff75f25490eab0a68f02bc9b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bwm-ng/bwm-ng.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
new file mode 100644
index 0000000..6bb8355
--- /dev/null
+++ b/package/bwm-ng/bwm-ng.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
