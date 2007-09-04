From: Johan De Wit <johan.dewit@external.thalesaleniaspace.com>
Date: Tue, 04 Sep 2007 12:07:37 +0200
Subject: [Buildroot] Adding new package to toolchain, target or both ?
Message-ID: <1188900457.4793.13.camel@localhost.hobsite.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build an embedded system using buildroot to be used in an
arcade cabinet, using svgalib and advancemame.  

Since svgalib is not only needed at 'runtime' in the target as dynamic
library adn/or utility programs, I also need the some files to compile
eg. advmame.  I suspect i have to add these to the toolchain to keep the
target clean.  I'm still in doubt if my 'logic' is correct and would be
glad if someone could give some advice on this issue.

Thanks
