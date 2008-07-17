From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Thu, 17 Jul 2008 16:38:14 -0500
Subject: [Buildroot] phy driver
Message-ID: <487FBBC6.8070107@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've updated the phy driver for smsc devices (smsc.c ).
(Which is a question in itself; where do I submit the patch?)
It had worked fine with 2.6.22 but 2.6.25 & 2.6.26 seem to have a 
preference for the generic driver @ phy address 0 over my h/w specific 
driver for the phy @ phy address 0x1F.
Any suggestions?
Regards,
Joe
