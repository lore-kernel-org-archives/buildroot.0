From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 22 Jun 2010 01:32:45 +0200
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
Message-ID: <201006220132.46363.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Dienstag 22 Juni 2010 01:25:24 schrieb H Hartley Sweeten:
>  /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire strip:
>  Unable to recognise the format of the input file
>  `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'
>  /usr/bin/install: strip process terminated abnormally

Hi Hartley,

what's the output of
$ file /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire

strip seems to have a problem with it - maybe its not an executable but a 
shell script - I used to have this problem with a package I created myself 
some while ago.

Peter
