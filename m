From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 8 Aug 2013 17:18:24 +0100
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <52037954.9080408@zacarias.com.ar>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
 <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
 <20130808100303.2b0226dd@skate> <52037954.9080408@zacarias.com.ar>
Message-ID: <CAHt8ZCNq1=PW86bwDN0Aqg969ukzR_Z-0hQE=WcDo7b+Tg-uFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On 8 August 2013 11:56, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> 1) Reinstate patches in the appropiate place since uclibc was packaged.
> 2) Probably add various "depends on !BR2_avr32" in packages that need
> newer syscalls (alternatively add a ton of backports for uclibc 0.9.31
> from newer releases).
> 3) Revert startfiles cleanup to the old manual way, adding new
> exceptions/modes for the noMMU crowd (it wasn't handled before) - or
> alternatively also patch the uclibc 0.9.31 makefile to make it more
> 0.9.32/33-ish like.

That doesn't sound too bad. I'm happy to do this work, if appropriate.
Perhaps your point #2 will not be necessary in the short term...?

> In my opinion, sorry if it hurts someone, we're going in circles trying
> to keep up with a dead architecture, because that's what it is, no
> matter how much support some people/companies want to give for their
> products the onus shouldn't be on us that things weren't upstreamed in a
> proper fashion which would make things far more simple.

I understand where you're coming from here. I'm not sure we're "going
in circles" just yet, but appreciate that it may come to that.

Simon.
