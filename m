From: Christopher Taylor <chtaylo3@gmail.com>
Date: Wed, 6 Aug 2008 11:10:01 -0400
Subject: [Buildroot] efficient usb plug in notification
Message-ID: <2590773a0808060810o7c07b114ude1a67ed8745dd41@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to see what my best options are of getting USB plugin
notifications in user-space in a buildroot/uClibc env.

Since this is an embedded platform, I'm really concerned about
efficiency of the mechanisms and I'm not sure how efficient udev +
dbus + hal is. Does anyone have any thoughts on this and what some
reasonable alternatives are within the buildroot chain?

-Chris
