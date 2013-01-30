From: Vikram Kerkar <vikramkerkar@gmail.com>
Date: Wed, 30 Jan 2013 17:33:21 +0530
Subject: [Buildroot] Netplug daemon Problem
Message-ID: <CAKDF3SF2VGStrdaQDeo5wg=dtX1n=bJt834Sgqs1s-4qQpDrYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Recently I have upgraded buildroot version to 'Buildroot-2012.11.1' on my
device (AT91SAM9260).
I have noticed that I am getting some network related problem.
PROBLEM :
      When I remove the ethernet jack and re-insert it, device is not able
to bring up the network, and hence no IP address.
      But at boot time, if ethernet cable is connected to device, it gets
IP address.

As far as I can think, this problem is related to Netplug daemon.
Netplug version in my buildroot is 'netplug-1.2.9.2'

Really looking for your reply,
Thanks in advance.

-- 
Regards,
*Vikram Kerkar*
Pune
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130130/91ccf732/attachment.html>
