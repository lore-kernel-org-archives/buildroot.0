From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Jun 2009 11:26:42 +0000 (UTC)
Subject: [Buildroot] [Bug 401] New: new package: ffmpeg
Message-ID: <bug-401-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=401

           Summary: new package: ffmpeg
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at raumfeld.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=401)
 --> (https://bugs.busybox.net/attachment.cgi?id=401)
package/multimedia/ffmpeg/Config.in

FFmpeg is a complete, cross-platform solution to record, convert and stream
audio and video. See http://ffmpeg.org/

I am attaching Config.in and ffmpeg.mk to add ffmpeg as a new package to
buildroot. So far the buildroot this package only builds libavcodec and
libavformat. Support for the ffmpeg, ffplay and ffserver binaries could be
added later. Another thing that could, and probably should, be added is a way
to easily configure the set of supported codecs from the buildroot config
system. But to keep things simple, here's a simple package definition to start
with.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
