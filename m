From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 15 Aug 2007 13:34:22 +0200
Subject: [Buildroot] Searching for Buildroot Version without Bugs and
	Kernel 2.6.20.x support for ARM 9
References: <46C1FA12.2070201@florian-strunk.de>
Message-ID: <002b01c7dfdb$271f67f0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Florian Strunk" <mailinglist_buildroot_uclibc.org@florian-strunk.de>
To: <buildroot@uclibc.org>
Sent: Tuesday, August 14, 2007 8:53 PM
Subject: [Buildroot] Searching for Buildroot Version without Bugs and Kernel 2.6.20.x support for ARM 9


> Searching for Buildroot version without bugs and kernel 2.6.20.x support
> for ARM 9 (*AT91SAM9260-EK*).
> 
> Witch version of BuildRoot should I use?
> 
> Thanks.
> 
> Florian


You will find a good package at www.at91.com .
Go to the *Linux Forum* and look for buildroot.
There will be an entry with a script which downloads and build
everything you need.

The buildroot *PROJECT* at www.at91.com is outdated.

The buildroot svn still needs additional patches to make linux work
for several boards, but this is complex so it will take time to 
have this running in the official buildroot.

The official buildroot AT91 support is focusing on linux-2.6.22.1 at the moment

Best Regards
Ulf Samuelsson
