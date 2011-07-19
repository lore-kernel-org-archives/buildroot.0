From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 19 Jul 2011 09:23:30 -0400
Subject: [Buildroot] [Bug 3685] ncurses installation hangs due to old
 version of tic
In-Reply-To: <20110719124505.D22168B2ED@busybox.osuosl.org>
References: <bug-3685-163@https.bugs.busybox.net/>
 <20110719124505.D22168B2ED@busybox.osuosl.org>
Message-ID: <CANPyyuNysycKDHUOJbanqWB4qp0t+NgWKYjk5xyj3bV7BypDJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

> --- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ?---
> (In reply to comment #2)
>> Any specific reason why this has not been included in buildroot yet?
>>
>> Thanks,
>> Thomas
>
> No, I just haven't looked at it / forgotten about it / not been able to
> reproduce it locally. Will take a look at it tonight.

I also had this problem. It appears to be caused by the old version
present on RHEL 5.4, which is what I'm using in our corporate
environment. If I had to guess, it would be because the tic being
called is the one on the host system, not the one built by buildroot.

Mike
