From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Jul 2019 08:21:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.24.3
In-Reply-To: <20190704091006.4701-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 4 Jul 2019 12:10:06 +0300")
References: <20190704091006.4701-1-aperez@igalia.com>
Message-ID: <8736jlxapy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Version 2.24.3 is a minor update which contains many bugfixes.
 > From the announcement:

 >   - Fix previous/next gestures in RTL mode.
 >   - Fix rendering artifacts in popular sites (YouTube, GitHub, etc.)
 >   - Fix media playback annoyances (volume randomly changing, HLS streams
 >     starting too slowly, some audio streams would not play, etc.)
 >   - Fix build with audio and video disabled.

 >   https://webkitgtk.org/2019/07/02/webkitgtk2.24.3-released.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

Given the above, should this be applied to 2019.02.x / 2019.05.x as
well?

-- 
Bye, Peter Korsgaard
