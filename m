From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Feb 2012 08:46:52 +0100
Subject: [Buildroot] [PATCH] Add gst-av package
In-Reply-To: <CAMP44s0wq2AT0-ayCovzXwxz0qMo=c5xqEc0VXtcjG2rvU9hvw@mail.gmail.com>
 (Felipe Contreras's message of "Sun, 12 Feb 2012 00:54:27 +0200")
References: <1328919431-22820-1-git-send-email-felipe.contreras@gmail.com>
 <87d39l1hwr.fsf@macbook.be.48ers.dk>
 <CAMP44s2pzn3vZXve8VCsNPM0iX=AVB83cFnxoj0t3KJo5rxqkw@mail.gmail.com>
 <87zkcpz2i1.fsf@macbook.be.48ers.dk>
 <CAMP44s0wq2AT0-ayCovzXwxz0qMo=c5xqEc0VXtcjG2rvU9hvw@mail.gmail.com>
Message-ID: <87vcncze6r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

Hi,

 Felipe> ---
 Felipe> In addition, it is much simpler (2654 vs 16575 LOC), has better
 Felipe> performance, and has a bit of extra features (such as less latency),
 Felipe> and doesn?t use deprecated API?s. In a previous post I measured
 Felipe> exactly how much improvement compared to gst-ffmpeg there is; it?s not
 Felipe> much, but it?s some.
 Felipe> ---

 Felipe> Yes, I have actually measured the power usage[2].

 Felipe> But the main reason is the complexity of the code. If you
 Felipe> quickly skim through both code-bases, you would see what I mean
 Felipe> :)

Ok, I get it now - Thanks.

-- 
Bye, Peter Korsgaard
