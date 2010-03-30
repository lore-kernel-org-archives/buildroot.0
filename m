From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 29 Mar 2010 20:21:34 -0500
Subject: [Buildroot] FOO_AUTORECONF bug
Message-ID: <0D753D10438DA54287A00B02708426976369152CA9@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build a custom package the uses an AUTOTARGETS mk file.  This
package has FOO_AUTORECONF = YES in it.  I haven't built the package in
quite a while but it used to build with no problems.

I just tried rebuilding it and got the following error message:

>>>   Patching libtool
>>>   Autoreconfiguring
/bin/sh: /home/bigguiness/buildroot/output/host/usr/bin/autoreconf: No such file or directory

What am I missing that would put autoreconf into my $(HOST_DIR)?

This is with the latest git pull.

FWIW, the package is just a bunch of small apps that I use for testing
various features on my board.  It uses FOO_AUTORECONF since I add/remove
apps from the package quite often.

Thanks,
Hartley
