From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 12 Oct 2012 15:50:17 +0200
Subject: [Buildroot] Messa3d fails.
Message-ID: <1531E53627F1F749B4FE809BF2A4EB670397D6CD@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Anyone succeeded in building X11 with the latest (git)  buildroot ?

I'm having troubles with building messa3d, I've tried to change the
dependecies so that makedepend is included into the messa3d
depends-list, but no success.

checking for make... make
checking for python2... no
checking for python... python
checking for makedepend... no
checking for sed... /bin/sed
configure: error: makedepend is required to build Mesa


Regards Noel
