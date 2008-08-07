From: Christopher Taylor <chtaylo3@gmail.com>
Date: Wed, 6 Aug 2008 23:23:08 -0400
Subject: [Buildroot] efficient usb plug in notification
In-Reply-To: <20080806151826.GA9470@real.realitydiluted.com>
References: <2590773a0808060810o7c07b114ude1a67ed8745dd41@mail.gmail.com>
	<20080806151826.GA9470@real.realitydiluted.com>
Message-ID: <2590773a0808062023p4da348eatfbdd1999e6f9ea20@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank y ou so much for your reply

On Wed, Aug 6, 2008 at 11:18 AM,  <sjhill@realitydiluted.com> wrote:
>> I'm trying to see what my best options are of getting USB plugin
>> notifications in user-space in a buildroot/uClibc env.
>>
> Is this for USB storage devices only, or all types of USB devices?

Well I have two different projects. One is USB devices in general and
it's VERY power conscious and the other is just USB storage and it's
not that big of a deal.


> I used 'udev' in all my embedded platforms. I did the original work
> of getting dbus and hal into buildroot, but it was a royal pain. If
> you are just doing USB storage devices, look at the usbmount package.
> It works great and I can certainly help you with that if you hit any
> snags.

Is power consumption/battery life  an issue on any of the projects you
used the udev/dbus/hal combination and were you able to quantify their
effect on power usage?

Thank you very much for your suggestion, I may post again if I run
into any snags.

IN getting dbus and hal into buildroot, did you get it into the
toolchain or is it that you were able to get it into the fs role
inside buildroot.  Either one deserves kudos.

-Chris
