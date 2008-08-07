From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 07 Aug 2008 09:44:43 +0200
Subject: [Buildroot] efficient usb plug in notification
In-Reply-To: <2590773a0808060810o7c07b114ude1a67ed8745dd41@mail.gmail.com>
References: <2590773a0808060810o7c07b114ude1a67ed8745dd41@mail.gmail.com>
Message-ID: <489AA7EB.4000102@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher Taylor wrote:
> I'm trying to see what my best options are of getting USB plugin
> notifications in user-space in a buildroot/uClibc env.
> 
> Since this is an embedded platform, I'm really concerned about
> efficiency of the mechanisms and I'm not sure how efficient udev +
> dbus + hal is. Does anyone have any thoughts on this and what some
> reasonable alternatives are within the buildroot chain?
> 

There is a mdev applet in busybox - a smaller version of udev. It works 
similar to hotplug. I haven't used it extensively but it is not hard 
to use, plus everything is in the buildroot already;)

See http://wildanm.wordpress.com/2007/08/21/mdev-mini-udev-in-busybox.

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
