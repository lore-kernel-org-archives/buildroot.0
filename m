From: Bryce Schober <bryce.schober@gmail.com>
Date: Wed, 21 Aug 2013 13:22:12 -0700
Subject: [Buildroot] syslog output to serial console
Message-ID: <CAJpxd044gjJfXpwbMfC_3VAUU26-DgD+Sex4fACjWGszR2MjPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I realize that this is a bit off-topic...

I've configured my target for boot-loader & linux boot serial console
output, but now I'd really like to redirect the rest of what gets into
syslog to the serial console as well. Is there a way to do that with
busybox syslog?

The primary use-case here is for seeing the output results / errors from my
set of /etc/init.d scripts, so if it's not feasible to get this
re-direction up and running early in the boot process, it wouldn't be worth
it.

Thanks for any advice or pointers you can offer...
<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130821/7bbba8b0/attachment.html>
