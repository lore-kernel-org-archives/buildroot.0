From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:12:30 +0100
Subject: [Buildroot] [git commit] docs/manual: fix bash export syntax in
	example code
Message-ID: <20151111221235.BA14D8082E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89b7375b0f9f55183b5157473d849367d4f5b5cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To export a variable in .bashrc we shouldn't put a '$' at the
beginning of the line, and there must be a '=' between key and value.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/download-location.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index cca7e7e..0b53f54 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -17,7 +17,7 @@ set, then the value of +BR2_DL_DIR+ in the Buildroot configuration is
 overridden. The following line should be added to +<~/.bashrc>+.
 
 -----------------
- $ export BR2_DL_DIR <shared download location>
+ export BR2_DL_DIR=<shared download location>
 -----------------
 
 The download location can also be set in the +.config+ file, with the
