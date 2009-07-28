From: Chris Smith <chris.smith@tandberg.com>
Date: Tue, 28 Jul 2009 13:02:57 +0100
Subject: [Buildroot] Problem using netsnmp
Message-ID: <4A6EE8F1.3060302@tandberg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I build netsnmp the built snmpd doesn't work on the target.  All 
the other snmp stuff works but I get
lib.so.6 not found when trying to run snmpd.

Anyone have any thoughts?  It is as if some linkage to host based 
libraries has crept in.
