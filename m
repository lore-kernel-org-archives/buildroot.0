From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 30 Sep 2011 16:46:20 +0200
Subject: [Buildroot] [PATCH 1/2] gst-ffmpeg: change back to use the
 included version of ffmpeg
In-Reply-To: <1317392243-27154-1-git-send-email-s.neumann@raumfeld.com>
References: <1317392243-27154-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317394170.15482.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2011-09-30 at 16:17 +0200, Sven Neumann wrote:
> Upstream buildroot uses the system-wide installed copy of ffmpeg.
> Since we only need ffmpeg for the gstreamer plug-in, go back to
> using the included version.
> 
> Also had to disable iwmmxt optimizations, we might want to review
> this later...

I am sorry, this is not the patch that I wanted to submit. Please ignore
it. Will resend the proper patchset.


Sven
