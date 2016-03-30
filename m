From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 16:47:26 -0300
Subject: [Buildroot] [PATCH] gst1-libav: pass --cpu config option to
 bundled ffmpeg
In-Reply-To: <56FC2C5B.4020609@mind.be>
References: <1459358152-21729-1-git-send-email-gustavo@zacarias.com.ar>
 <56FC2C5B.4020609@mind.be>
Message-ID: <56FC2D4E.9090807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/16 16:43, Arnout Vandecappelle wrote:

>   So, you didn't need to pass --sysroot for Sourcery toolchains, like I
> had to in my v2 of this patch [1]? (I've marked [1] as Superseded now.
> Probably if my commit log would have been a little terser, it would
> already have been applied :-)
>
>   Regards,
>   Arnout
>
> [1] http://patchwork.ozlabs.org/patch/589657/

No, it worked right away.
Anyway http://patchwork.ozlabs.org/patch/603578/ handles this the way it 
should be :)
When i noticed the license info was missing i wanted to avoid the super 
headache besides potentially duplicating ffmpeg package optimizations 
and size on the target and, well, making the package trivial.
gst1-libav bundles ffmpeg 3.0 which we'll soon get, and anyway it also 
works with our current 2.8.6 version as well.
Regards.
