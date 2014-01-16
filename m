From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Jan 2014 23:54:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] gst-ffmpeg: Use internal libav
	instead of external ffmpeg
In-Reply-To: <BLU0-SMTP123CF536ADA15AAB1DD2175D9B90@phx.gbl> (Bernd Kuhls's
 message of "Thu, 16 Jan 2014 20:48:04 +0100")
References: <BLU0-SMTP123CF536ADA15AAB1DD2175D9B90@phx.gbl>
Message-ID: <878uufpmg5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > External ffmpeg 1.2.4 is incompatible, gst-ffmpeg suggests
 > to always use internal libav.

 > Adding one patch:
 > Fixes compiling with gcc-4.7: gst-ffmpeg-0.10.13_gcc47.patch (taken from Slackware)

 > Fixes
 > http://autobuild.buildroot.net/results/ab8/ab8ec4904020ceb848a1e50f1865f594f46b8295/
 > http://autobuild.buildroot.net/results/f0a/f0a420015a92ebb8868c41c0dbf82cf27b2bdd0f/

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 > Changes v1 -> v2:
 > - replaced gst-ffmpeg-uclibc.patch with configure option --target-os=linux (Peter)
 > - port libav-supported CPU optimization flags from ffmpeg/ffmpeg.mk (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
