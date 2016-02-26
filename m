From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Fri, 26 Feb 2016 20:00:23 -0000
Subject: [Buildroot] autofs issue?
Message-ID: <0b3201d170d0$541bedc0$fc53c940$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using BR 2016-02 with custom kernel (local directory containing linux-stable
repo). Autofs4 kernel module is built-in.

 

Having noted this:
http://git.buildroot.net/buildroot/commit/?id=b78a95d109ea335406bbac2957c4cc
85b98838d4 I wonder if there is another issue?

 

The autofs script that gets added to /etc/init.d seems to be a bash script
(?) Consequently this is failing on a Busybox system. Have I
misunderstood/misconfigured something?

 

Jerry.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160226/12fc6365/attachment.html>
