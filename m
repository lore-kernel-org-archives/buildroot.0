From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 6 Aug 2008 10:18:26 -0500
Subject: [Buildroot] efficient usb plug in notification
In-Reply-To: <2590773a0808060810o7c07b114ude1a67ed8745dd41@mail.gmail.com>
References: <2590773a0808060810o7c07b114ude1a67ed8745dd41@mail.gmail.com>
Message-ID: <20080806151826.GA9470@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'm trying to see what my best options are of getting USB plugin
> notifications in user-space in a buildroot/uClibc env.
> 
Is this for USB storage devices only, or all types of USB devices?

> Since this is an embedded platform, I'm really concerned about
> efficiency of the mechanisms and I'm not sure how efficient udev +
> dbus + hal is. Does anyone have any thoughts on this and what some
> reasonable alternatives are within the buildroot chain?
> 
I used 'udev' in all my embedded platforms. I did the original work
of getting dbus and hal into buildroot, but it was a royal pain. If
you are just doing USB storage devices, look at the usbmount package.
It works great and I can certainly help you with that if you hit any
snags.

-Steve
