From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 23 Jun 2010 12:03:38 -0500
Subject: [Buildroot] package/customize
Message-ID: <0D753D10438DA54287A00B027084269763716C4C12@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Is there a way to tag the package/customize directory so that a 
'git pull' will ignore it?  I use that directory as a hacking point
to test/add packages that are not currently in buildroot.  Right
now, every time I do a git pull I have to copy that directory out
of my tree and restore the original one before I do a 'git pull' to
update my tree.

Thanks,
Hartley
