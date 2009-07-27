From: Craig Butler <crbutler@tycoint.com>
Date: Mon, 27 Jul 2009 01:31:49 +0100
Subject: [Buildroot] uclibc busybox problems dm365 - rcS: applet not found
	???
Message-ID: <1248654709.37180.18.camel@main.lerwick.hopto.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

I am having an issue trying to boot a dm365 using a busybox compiled
using the buildroot uclibc toolchain;

Freeing init memory: 128K
rcS: applet not found

Please press Enter to activate this console. 

Please press Enter to activate this console.  -- loops

It appears as tho the sh link isn't working...

Exactly the same busybox .config works when compiled with a glibc based
toolchain (grabbed from codesourcery.com), can get the board up and
working, obtain an dhcp lease, and telnet onto it.

I have set busybox to be statically compiled.

Anyone seen this issue before ? 

-- 
Kind Regards

Craig Butler
Linux Systems Administrator
American Dynamics, Belfast

e- crbutler at tycoint.com
 
--------------------------------------------------------

Tyco Safety Products/CEM Systems Ltd.
Registered in Northern Ireland: NI 25728.  Registered Office: 195 Airport Road West, Belfast, BT3 9ED.
 
Please note that any views or opinions presented in this email are solely those of the author and do not necessarily represent those of the company. This email and any attachments are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the sender immediately and delete any copies in your possession.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090727/823619d3/attachment-0001.htm>
