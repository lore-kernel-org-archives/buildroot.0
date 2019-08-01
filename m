From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 01 Aug 2019 22:37:39 +0200
Subject: [Buildroot] [PATCH 1/3] package/bison: bump version to 3.4.1
References: <20190630080904.4105-1-bernd.kuhls@t-online.de>
 <20190801154455.48a520bd@windsurf.home>
Message-ID: <j5vb1gx10k.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 01 Aug 2019 15:44:55 +0200 schrieb Thomas Petazzoni:

> Applied to master, thanks.

Hi Thomas,

since I cannot reproduce the build error with host-bison
http://autobuild.buildroot.net/?reason=host-bison-3.4.1

mv: cannot stat `examples/c/reccalc/scan.stamp.tmp': No such file or 
directory

I would like to ask if the command

sed -i '6855 s/mv/cp/' Makefile.in

mentioned by http://www.linuxfromscratch.org/lfs/view/development/
chapter06/bison.html fixes the problem on your autobuilder.

Regards, Bernd
