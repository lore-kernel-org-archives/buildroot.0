From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 09:55:32 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
Message-ID: <20161005095532.683204d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Oct 2016 09:07:28 +0200, Jean-Michel Hautbois wrote:

> I am trying to get a working Xenomai 3.x package with buildroot.
> My main objective is to have it running with Mercury (ie. PREEMPT_RT
> and not Adeos), and ideally with the compatibility layer for Xenomai
> 2.x existing applications.
> 
> I had a look at this thread :
> http://lists.busybox.net/pipermail/buildroot/2016-January/150791.html
> 
> I was wondering if anyone already worked on this stuff, in order to
> combine the efforts ?
> I can do it on my own, of course, but I think it would be better to
> have it integrated upstream :) !

So far, we haven't received any patch to add Xenomai 3.x support in
Buildroot, and I've not heard (besides you asking questions on IRC)
anyone working on this currently.

So patches are definitely welcome. It's not clear to me whether we want
to support both Xenomai 2.x and Xenomai 3.x, or if supporting Xenomai
3.x is sufficient, as a replacement for Xeonmai 2.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
