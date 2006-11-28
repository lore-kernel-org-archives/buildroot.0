From: Rafael A Barrero <rafa@linux.it>
Date: Tue, 28 Nov 2006 21:27:39 +0100 (CET)
Subject: [Buildroot] new DHCP version and make error
Message-ID: <54185.206.190.75.8.1164745659.squirrel@picard.linux.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys;

New to the list... and to buildroot. I've been working with embedded linux
on the application side, but never really dug too deep enough to build my
own system until now. I also wanted to say thanks for all the hard work.

BusyBox seems to build against DHCP 3.0.4, but the FTP server at ISC
doesn't seem to host that version in the /isc/dhcp/ directory any longer
(moved to /isc/dhcp/dhcp-3.0-history/ now). Does anyone have any
experience building dhcp 3.0.5 instead of 3.0.4? Any problems?

Also, I was getting a make error "CONFIG_SYSLOGD: redefined". Has anyone
seen this?

Rafael.
