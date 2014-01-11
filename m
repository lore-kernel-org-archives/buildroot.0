From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 11 Jan 2014 13:52:56 -0800
Subject: [Buildroot] busybox and exporting variables
Message-ID: <CALo-6+gWgZ0Oj23CU7MzMtWGYShcL3uPcNUn5Mstj3GO=UCVMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is more of a busybox then buildroot question, but please bear with me.

I have two designs now in production using buildroot and need to accomplish
a few things that seem to be escaping me with busybox and would appreciate
a bit of advice.

1. I would like to execute a couple of bash commands (killall and rmmod)
when the "reboot" command is executed. I *thougth* that I could add these
to /etc/inittab in the shutdown section, but they dont execute. Is there a
way to easily execute a couple of bash commands in busybox when the
"shutdown" command is executed?

2. I cannot seem to export variables from /etc/init.d resource scripts.
What could be unique about a busybox environment that would preclude any
script executing in /etc/init.d to *not* export a variable. A clue or two
would be appreciated.

Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140111/1a2acf86/attachment.html>
