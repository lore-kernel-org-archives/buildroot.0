From: Arun Reddy <reddyac@gmail.com>
Date: Mon, 28 Apr 2008 15:32:07 -0700
Subject: [Buildroot] Buildroot ARM toolchain build Error: libexpat
Message-ID: <326f33790804281532w187e0968lcc383e59fe65c77a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I have done a kernel configuration for at91sam9263ek, and I am now going
through the build process. I have fixed up some errors I encountered with
missing packages, but I then encountered that...

Checking for XML_ParserCreate in -lexpat... no
Checking for XML_ParserCreate in -lbsdxml... no
Configure: error: *** neither libexpat not libbsdxml could be found ***

I made sure to install the expat package (apt-get install libexpat-dev) and
tried to find out if I needed to install the libbsdxml package as well, but
couldn't find enough information online about what libbsdxml is (it does
seem like it's just another name for libexpat) or any solutions to this
error.

Anyone know what the problem here is, and what package I actually need?
Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080428/dcc01171/attachment.htm 
