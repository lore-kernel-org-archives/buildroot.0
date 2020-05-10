From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:33:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix CVE-2020-12284
In-Reply-To: <20200506220914.655071-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 May 2020 00:09:14 +0200")
References: <20200506220914.655071-1-fontaine.fabrice@gmail.com>
Message-ID: <87imh3r0n7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cbs_jpeg_split_fragment in libavcodec/cbs_jpeg.c in FFmpeg 4.2.2 has a
 > heap-based buffer overflow during JPEG_MARKER_SOS handling because of a
 > missing length check.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
