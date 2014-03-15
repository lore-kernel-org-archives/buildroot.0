From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Mar 2014 23:21:30 +0100
Subject: [Buildroot] [PATCH v3 2/4] libee: new package
In-Reply-To: <1394646669-10461-2-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Wed, 12 Mar 2014 12:51:07 -0500")
References: <1394646669-10461-1-git-send-email-clshotwe@rockwellcollins.com>
 <1394646669-10461-2-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <87fvmjksr9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
 > ---
 > +
 > +LIBEE_VERSION = 0.4.1
 > +LIBEE_SITE = http://www.libee.org/download/files/download/
 > +LIBEE_LICENSE = LGPLv2.1+
 > +LIBEE_LICENSE_FILES = COPYING
 > +LIBEE_DEPENDENCIES = libestr

It uses pkg-config to find libestr, so we also need to add host-pkgconf
to dependencies.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
