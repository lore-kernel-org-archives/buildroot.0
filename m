From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 14:42:23 -0300
Subject: [Buildroot] [PATCH] gst1-libav: pass --cpu config option to
 bundled ffmpeg
In-Reply-To: <20160330193952.2e872f06@free-electrons.com>
References: <1459358152-21729-1-git-send-email-gustavo@zacarias.com.ar>
 <20160330193952.2e872f06@free-electrons.com>
Message-ID: <56FC0FFF.5000602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/16 14:39, Thomas Petazzoni wrote:

> <rant>Can I say, once again, how much I hate bundled libraries?</rant>
>
> Applied, thanks!
>
> Thomas

Heh, you're not alone.
Ideally we can unbundle, we just need to find out all of the options the 
gst component needs from ffmpeg.
Right now for gst-libav-1.8.0 it bundles ffmpeg 3.0 so having the bump 
is kind of a prerequisite, i'll look into it and also adding the (surely 
complicated) licensing info.
Unbundling would get rid of all the duplication in ffmpeg conditions, i 
went for minimal in this case to fix mips, but there are other 
discrepancies/lack of optimizations.
Regards.
