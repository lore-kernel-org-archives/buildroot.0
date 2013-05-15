From: Anders Darander <anders.darander@gmail.com>
Date: Wed, 15 May 2013 08:01:54 +0200
Subject: [Buildroot] [PATCH v4 2/4] am33x-cm3: add FW for suspend/resume
In-Reply-To: <87fvxpqoa1.fsf@dell.be.48ers.dk>
References: <1368562193-26149-1-git-send-email-anders@chargestorm.se>
 <1368562193-26149-3-git-send-email-anders@chargestorm.se>
 <87fvxpqoa1.fsf@dell.be.48ers.dk>
Message-ID: <CAE4k23-O2q4+qB4kE0uXAdDOnSvgAw=zVuQ+WXzJU0Rx-i1tKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the small fixes you made prior to committing.


On 14 May 2013 22:50, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Anders" == Anders Darander <anders@chargestorm.se> writes:
>
>  Anders> Without this firmware, the beaglebone won't be able to reboot
>  Anders> correctly.
>
> It's afaik only for suspend/resume handling (E.G. low power).
>

Well, at least on my board will hang if I issue `reboot` without having
loaded the FW...
Though, from the descriptions in the repo, I'd also have assumed that it
was only needed for the low power modes.

But that's mostly nitpicking, I guess...

Cheers,
Anders
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130515/93a4fe83/attachment-0001.html>
