From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 08:36:38 -0300
Subject: [Buildroot] [PATCH] libmpeg2: move ARM patch to the correct
	directory
Message-ID: <1337772998-29910-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch was added after the multimedia category reorganization so it
became unreachable.
Move it to the final libmpeg2 package directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libmpeg2/libmpeg2-0.5.1-armv4l.patch           |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename package/{multimedia => }/libmpeg2/libmpeg2-0.5.1-armv4l.patch (100%)

diff --git a/package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch b/package/libmpeg2/libmpeg2-0.5.1-armv4l.patch
similarity index 100%
rename from package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch
rename to package/libmpeg2/libmpeg2-0.5.1-armv4l.patch
-- 
1.7.3.4
