From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Jul 2011 07:14:18 +0200
Subject: [Buildroot] [PATCH] new package: libav
In-Reply-To: <20110705224642.4953b847@skate> (Thomas Petazzoni's message of
 "Tue, 5 Jul 2011 22:46:42 +0200")
References: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
 <20110705224642.4953b847@skate>
Message-ID: <87k4bwuh1x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> - I found that ffmpeg (at least 0.6.3) does _not_ work with minidlna
 >> (buildroot patch forthcoming), there are strange hangups just
 >> calling av_stream_info() on many ts files.
 >> libav worked out of the box in this context.
 >> 
 >> Signed-off-by: Wolfram Gloger <wg@malloc.de>

 Thomas> Could you turn this into a proper commit log message ? Could you also
 Thomas> send your patch inline and not as an attached file ? This make it
 Thomas> easier to review and comment.

Yes please - Please use git format-patch -s / git send-email

 Thomas> If the libav package is a copy of the ffmpeg one, isn't it
 Thomas> possible to share the same .mk file ? We could then make them
 Thomas> separate when/if libav diverges from ffmpeg in a significant
 Thomas> way.

I haven't followed the libav discussions in detail - Is it (currently) a
100% drop in replacement for ffmpeg? If so, perhaps we should handle it
like the modular/tinyx selection for the X server. If not, I think it
should be two completely independent packages.

-- 
Bye, Peter Korsgaard
