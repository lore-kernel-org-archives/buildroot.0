From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Feb 2012 18:47:02 +0100
Subject: [Buildroot] [PATCH] Add gst-av package
In-Reply-To: <CAMP44s2pzn3vZXve8VCsNPM0iX=AVB83cFnxoj0t3KJo5rxqkw@mail.gmail.com>
 (Felipe Contreras's message of "Sat, 11 Feb 2012 19:22:44 +0200")
References: <1328919431-22820-1-git-send-email-felipe.contreras@gmail.com>
 <87d39l1hwr.fsf@macbook.be.48ers.dk>
 <CAMP44s2pzn3vZXve8VCsNPM0iX=AVB83cFnxoj0t3KJo5rxqkw@mail.gmail.com>
Message-ID: <87zkcpz2i1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

Hi,

 Felipe> I thought the help text explained that: gst-ffmpeg disables certain
 Felipe> codecs, like MP3, Vorbis, Theora, etc. IOW. It has political baggage
 Felipe> from GStreamer developers; they don't want people to use FFmpeg, they
 Felipe> want people to use native elements: vorbisdec, theoradec, maddec, etc.

But how does (more-or-less) reimplementing gst-ffmpeg change this
political baggage?

-- 
Bye, Peter Korsgaard
