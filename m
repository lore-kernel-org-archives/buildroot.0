From: =?ISO-8859-15?Q?Knut-H=E5vard_Aksnes?= <kna@tirsdagsklubben.nu>
Date: Wed, 28 May 2008 15:39:52 +0200
Subject: [Buildroot] Nasty bug in pkg-config
Message-ID: <483D60A8.3080504@tirsdagsklubben.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For information, bug [buildroot 0002914] is due to a nasty bug in 
pkg-config, easily forcing reboot of the compiling machine.

The bug hits during compilation of diverse packages, among them RPM, ATK 
and X11R7.
For a description of the bug and a workaround see the comments to the 
[buildroot 0002914] bugreport.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kna.vcf
Type: text/x-vcard
Size: 507 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080528/82923048/attachment.vcf 
