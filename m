From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:35 -0000
Subject: [Buildroot] [git commit branch/next] libmpeg2: move ARM patch to
	the correct directory
Message-ID: <20120802195234.2064E96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3c46e4f17c4381ff526b00f805194fde72b8492
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch was added after the multimedia category reorganization so it
became unreachable.
Move it to the final libmpeg2 package directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libmpeg2/libmpeg2-0.5.1-armv4l.patch           |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch b/package/libmpeg2/libmpeg2-0.5.1-armv4l.patch
similarity index 100%
rename from package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch
rename to package/libmpeg2/libmpeg2-0.5.1-armv4l.patch
