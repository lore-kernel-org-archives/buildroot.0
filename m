From: Wolfram Gloger <wg@malloc.de>
Date: Wed, 13 Jul 2011 18:10:33 +0200
Subject: [Buildroot] [PATCH] new package: libav
In-Reply-To: <20110705224642.4953b847@skate> (message from Thomas Petazzoni on
 Tue, 5 Jul 2011 22:46:42 +0200)
References: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
 <20110705224642.4953b847@skate>
Message-ID: <0Ln0qf-1R89A42Okf-00hKUN@mrelayeu.kundenserver.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Could you turn this into a proper commit log message ? Could you also
> send your patch inline and not as an attached file ? This make it
> easier to review and comment.

Ok, I'll try to send it more git-compatible in the next revision
(forthcoming).

> If the libav package is a copy of the ffmpeg one, isn't it possible to
> share the same .mk file ? We could then make them separate when/if
> libav diverges from ffmpeg in a significant way.
> 
> What do you think ?

Basically I copied the .mk from ffmpeg, but it isn't purely a
s/FFmpeg/Libav/g job; the ffmpeg binary for example stays the same.

I would prefer to keep the .mk's separate for this and two more
reasons: the packages might well diverge and the duplication is not
excessive IMHO.

Regards,
Wolfram.
