From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:56:26 +0100
Subject: [Buildroot] [PATCH/next 4/8] package/libass: bump version to
	0.13.0
In-Reply-To: <1448134835-27519-4-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 21 Nov 2015 20:40:31 +0100")
References: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
 <1448134835-27519-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87y4dp4s1h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quote from https://github.com/libass/libass/blob/master/Changelog
 > "* Drop ENCA support"

 > Therefore we remove the dependency to libenca.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to next, thanks.

Have you done test builds of the reverse deps
(ffmpeg/gst1-plugins-bad/kodi/mplayer/vlc)?

-- 
Bye, Peter Korsgaard
