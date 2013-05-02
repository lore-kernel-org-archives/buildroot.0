From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 May 2013 23:19:48 +0200
Subject: [Buildroot] [PATCH] directfb: fix error in *SetRegion* datatypes
In-Reply-To: <1367524449-6403-1-git-send-email-c.schoenert@gmail.com> (Carsten
 Schoenert's message of "Thu, 2 May 2013 21:54:08 +0200")
References: <1367524449-6403-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <87zjwdyt8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> DirectFB comes with incorrect declarations for *SetRegion* datatypes,
 Carsten> this breaks the build for some GFX Drivers. Also there are some headers
 Carsten> missend in the archive, this breaks some other modules of directfb that
 Carsten> not covered yet by the autobuilders.
 Carsten> And at least the configure script doesn't use a variable for the
 Carsten> imlib2-config script. That breaks crossbuilds of directfb in most cases.

 Carsten> Fixes:
 Carsten> http://autobuild.buildroot.net/results/03465f0e14accc8d8f8fc2640b7a0dd8bec594e4

Committed, thanks.

-- 
Bye, Peter Korsgaard
