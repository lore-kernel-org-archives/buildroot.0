From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 May 2011 15:13:42 +0200
Subject: [Buildroot] [PATCH] ffmpeg: ffmpeg binary requires swscale
In-Reply-To: <BANLkTik9W5Ewhj=0FB+WbPnrJ8F8YwxU9w@mail.gmail.com> (Mike
	Williams's message of "Fri, 13 May 2011 08:39:52 -0400")
References: <1305233238-324-1-git-send-email-mike@mikebwilliams.com>
	<87wrhukhb3.fsf@macbook.be.48ers.dk>
	<BANLkTik9W5Ewhj=0FB+WbPnrJ8F8YwxU9w@mail.gmail.com>
Message-ID: <87pqnmkak9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Williams <mikebwilliams@gmail.com> writes:

 Mike> It looks like the configure script for ffmpeg 0.6.1 lists swscale as a
 Mike> dependency for ffmpeg. At least on my system, it isn't building the
 Mike> ffmpeg binary unless I also select swscale. ffserver, ffplay, and
 Mike> ffprobe all build fine without it.

 Mike> 1435: ffmpeg_deps="avcodec avformat swscale"

Ahh yes, you're right - I didn't notice as I didn't clear my target dir
between the two builds.

Committed, thanks.

-- 
Bye, Peter Korsgaard
