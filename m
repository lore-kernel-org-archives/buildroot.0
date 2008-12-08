From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Mon, 8 Dec 2008 23:00:09 +0100
Subject: [Buildroot] [PATCH 0/7] add Phonon support to qtopia4
In-Reply-To: <20081208190302.724298c4@hcegtvedt>
References: <200811190244.44817.markus.heidelberg@web.de>
	<200811250833.46629.markus.heidelberg@web.de>
	<20081208190302.724298c4@hcegtvedt>
Message-ID: <200812082300.09891.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt, 08.12.2008:
> Finally got some time to spin this around. Audio worked fine with the
> Qt examples, tested both Ogg and MP3.
> 
> Thanks for the patches, sorry I forgot to credit you except the last
> commit.

Can happen, thanks for committing.

> Now only to add gst-ffmpeg as well ;)

This would probably have been my next step, but I have rejected Phonon
for now. The video playback was just so slow. It took something about
15s to load the Qt example I sent and even longer to get the video
started. And the playback performance then wasn't better. Did I do
something wrong? I haven't yet tested it on ATSTK1002 nor 1005 and I'm
not sure I get round to it before the vacation.

So currently I'm using mplayer -geometry

Markus
