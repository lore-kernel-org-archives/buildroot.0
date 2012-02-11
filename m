From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 19:22:44 +0200
Subject: [Buildroot] [PATCH] Add gst-av package
In-Reply-To: <87d39l1hwr.fsf@macbook.be.48ers.dk>
References: <1328919431-22820-1-git-send-email-felipe.contreras@gmail.com>
 <87d39l1hwr.fsf@macbook.be.48ers.dk>
Message-ID: <CAMP44s2pzn3vZXve8VCsNPM0iX=AVB83cFnxoj0t3KJo5rxqkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 11, 2012 at 5:58 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
>
> ?Felipe> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
>
> A more detailed commit message would be good. How does this differ from
> gst-ffmpeg? I see you depend on ffmpeg and not libav (which we currently
> don't have in BR).

I thought the help text explained that: gst-ffmpeg disables certain
codecs, like MP3, Vorbis, Theora, etc. IOW. It has political baggage
from GStreamer developers; they don't want people to use FFmpeg, they
want people to use native elements: vorbisdec, theoradec, maddec, etc.

And gst-av works for both libav, and FFmpeg. Obviously, I wrote it for
libav, but FFmpeg is simply an old version of the same API.

Cheers.

-- 
Felipe Contreras
