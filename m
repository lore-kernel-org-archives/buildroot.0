From: Jonas Ludvigsson <jonas.ludvigsson@connectBlue.com>
Date: Thu, 12 Sep 2013 09:39:18 +0000
Subject: [Buildroot] Build errors in libnl
Message-ID: <BECCD53EFF877A4F8D909C37120A85375303BD96@CHEWBACCA.connectBlue.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using Buildroot (2013.05-rc2) together with Busybox (1.21) and Linux (3.2.45) for the TI AM335x EVM board.
I got the following build errors when building 'libnl' (3.2.22):

  CC     addr.lo
  CC     nl.lo
  CC     object.lo
  CC     utils.lo
  CC     socket.lo
addr.c:1027: error: 'AF_RDS' undeclared here (not in a function)
addr.c:1033: error: 'AF_CAN' undeclared here (not in a function)
addr.c:1034: error: 'AF_TIPC' undeclared here (not in a function)
addr.c:1038: error: 'AF_ISDN' undeclared here (not in a function)
addr.c:1039: error: 'AF_PHONET' undeclared here (not in a function)
make[3]: *** [addr.lo] Error 1

I'm quite new to Linux and Buildroot, but as far as I understand my configuration is missing something. Any ideas on what it could be?

BR,
Jonas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130912/ccb2815d/attachment-0001.html>
