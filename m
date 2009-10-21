From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Wed, 21 Oct 2009 06:39:20 -0700
Subject: [Buildroot] net-snmp version 5.5
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1098DE5AF@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

At the URL below, I submitted a simple patch to the net-snmp project for
net-snmp 5.5 so that I could build it under buildroot.

https://sourceforge.net/tracker/?func=detail&aid=2883220&group_id=12694&
atid=312694

To use net-snmp 5.5, drop the patch into packages/netsnmp and then
modify netsnmp.mk to set the version to 5.5 from 5.4.2.1 (or whatever it
is set to these days).

I used this to build net-snmp-5.5 in a buildroot-2009.02 environment for
a powerpc 405EP embedded linux system.  I then fired it up and played
with it a bit.


Regards,

Darcy
