From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Jan 2015 16:11:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/sane-backends: rename patches to
	the new naming convention
Message-ID: <1420902661-20721-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../{sane-backends-1.0.22-qcam-x86.patch => 0001-qcam-x86.patch}          | 0
 package/sane-backends/{sane-backends-1.0.22-v4l.patch => 0002-v4l.patch}  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/sane-backends/{sane-backends-1.0.22-qcam-x86.patch => 0001-qcam-x86.patch} (100%)
 rename package/sane-backends/{sane-backends-1.0.22-v4l.patch => 0002-v4l.patch} (100%)

diff --git a/package/sane-backends/sane-backends-1.0.22-qcam-x86.patch b/package/sane-backends/0001-qcam-x86.patch
similarity index 100%
rename from package/sane-backends/sane-backends-1.0.22-qcam-x86.patch
rename to package/sane-backends/0001-qcam-x86.patch
diff --git a/package/sane-backends/sane-backends-1.0.22-v4l.patch b/package/sane-backends/0002-v4l.patch
similarity index 100%
rename from package/sane-backends/sane-backends-1.0.22-v4l.patch
rename to package/sane-backends/0002-v4l.patch
-- 
1.9.3
