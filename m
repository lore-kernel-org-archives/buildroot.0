From: Wolfram Gloger <wg@malloc.de>
Date: Fri, 01 Jul 2011 18:27:13 +0200
Subject: [Buildroot] [PATCH] new package: libav
Message-ID: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is a copy of the ffmpeg package with the names and download
changed for libav-0.7.

Why choose this fork when there is "original" ffmpeg?

- It may be the future?  I don't know, but for sure it was dreadfully
  hard to get patches into ffmpeg.

- I found that ffmpeg (at least 0.6.3) does _not_ work with minidlna
  (buildroot patch forthcoming), there are strange hangups just
  calling av_stream_info() on many ts files.
  libav worked out of the box in this context.

Signed-off-by: Wolfram Gloger <wg@malloc.de>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2011.05-libav.diff
Type: application/octet-stream
Size: 10730 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110701/37dc5e8a/attachment-0001.obj>
