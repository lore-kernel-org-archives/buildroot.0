From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 13 Dec 2006 11:31:24 +0000 (UTC)
Subject: [Buildroot] Please include libstdc++ patch (enables build)
Message-ID: <loom.20061213T122305-692@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch here http://gcc.gnu.org/bugzilla/attachment.cgi?id=6132
which is mentioned in bug http://bugs.uclibc.org/view.php?id=904
is not yet incorporated into the patches supplied with Buildroot
as of yesterday (2006-12-12)

Could this be done so that everyone can benefit ?

If I could find out the 'official' way to do this, I would,
but I could not find it in the docs.

Also I do not have access to any Buildroot regression tests,
where are these available from ? I would willingly run these
to check specific patches.

The patch certainly fixes the problem on 3.4.x builds.

Thanks.

MikeW
