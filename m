From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:56:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.24.3
In-Reply-To: <20190705110204.GB8135@momiji> (Adrian Perez de Castro's message
 of "Fri, 5 Jul 2019 11:02:04 +0300")
References: <20190704091006.4701-1-aperez@igalia.com>
 <8736jlxapy.fsf@dell.be.48ers.dk> <20190705110204.GB8135@momiji>
Message-ID: <87bly6bae2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Hello Peter,
 > On Fri, 05 Jul 2019 08:21:45 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
 >> 
 >> > Version 2.24.3 is a minor update which contains many bugfixes.
 >> > From the announcement:
 >> 
 >> >   - Fix previous/next gestures in RTL mode.
 >> >   - Fix rendering artifacts in popular sites (YouTube, GitHub, etc.)
 >> >   - Fix media playback annoyances (volume randomly changing, HLS streams
 >> >     starting too slowly, some audio streams would not play, etc.)
 >> >   - Fix build with audio and video disabled.
 >> 
 >> >   https://webkitgtk.org/2019/07/02/webkitgtk2.24.3-released.html
 >> 
 >> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 >> 
 >> Committed, thanks.
 >> 
 >> Given the above, should this be applied to 2019.02.x / 2019.05.x as
 >> well?

 > We do not have an accompanying security advisory for this release, but we
 > expect to have one for an upcoming 2.24.4 release a few weeks down the road,
 > so another option could be to wait until that release and skip this one point
 > release.

 > Nevertheless, if it is possible to have this patch applied to 2019.02.x and
 > 2019.05.x, that would be definitely very nice for people using WebKitGTK
 > (in particular due to the media playback fixes :D).

OK - Committed to 2019.02.x and 2019.05, thanks.

-- 
Bye, Peter Korsgaard
