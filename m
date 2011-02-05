From: bruce bushby <bruce.bushby@gmail.com>
Date: Sat, 5 Feb 2011 07:11:47 +0000
Subject: [Buildroot] easynews sourceforge mirror is down
Message-ID: <AANLkTi=WoaejX3iJWteTEprkeY=sWDFLY2dSC1PgiKHL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Not sure if the site is down for maintenance but the "easynews" sourceforge
mirror is no longer responding.

To get around this with existing config I simply added a local hosts file
entry using the IP address for "switch.dl.sourceforge.net"

echo "130.59.138.21 easynews.sourceforge.net" >> /etc/hosts


Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110205/c0e46751/attachment.html>
