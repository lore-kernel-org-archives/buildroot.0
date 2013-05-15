From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 May 2013 09:52:27 +0200
Subject: [Buildroot] [PATCH v4 2/4] am33x-cm3: add FW for suspend/resume
In-Reply-To: <CAE4k23-O2q4+qB4kE0uXAdDOnSvgAw=zVuQ+WXzJU0Rx-i1tKA@mail.gmail.com>
 (Anders Darander's message of "Wed, 15 May 2013 08:01:54 +0200")
References: <1368562193-26149-1-git-send-email-anders@chargestorm.se>
 <1368562193-26149-3-git-send-email-anders@chargestorm.se>
 <87fvxpqoa1.fsf@dell.be.48ers.dk>
 <CAE4k23-O2q4+qB4kE0uXAdDOnSvgAw=zVuQ+WXzJU0Rx-i1tKA@mail.gmail.com>
Message-ID: <8738tor878.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders.darander@gmail.com> writes:


 Anders>     It's afaik only for suspend/resume handling (E.G. low power).


 Anders> Well, at least on my board will hang if I issue `reboot`
 Anders> without having loaded the FW...

Perhaps with the TI kernel which has the suspend stuff integrated. It is
not (yet) in mainline, and mainline reboots fine without it.

 Anders> Though, from the descriptions in the repo, I'd also have
 Anders> assumed that it was only needed for the low power modes.

 Anders> But that's mostly nitpicking, I guess...

Indeed.

-- 
Bye, Peter Korsgaard
