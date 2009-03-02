From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Mon, 2 Mar 2009 12:40:19 +0100
Subject: [Buildroot] depend or select in Config.in & Autotarget question
Message-ID: <20090302124019.106a2593@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

what is the preferred method to resolve package dependencies in Config.in?
eg. when package-B needs package-A to build, should B "select" A or should
B "depend" on A?
And when using "depend" should there be an info when A is not active
(like ipsec-tools => openssl)?

I've started with the Makefile.autotools.in conversion of some packages that I use.
When should a AUTORECONF:=yes be used? So far it had no affect in my tests?

Regards
Olaf
