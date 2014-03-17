From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 23:12:07 +0100
Subject: [Buildroot] [PATCH] mtools: remove ignored configure options
In-Reply-To: <1394999237-30259-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Sun, 16 Mar 2014 15:47:17 -0400")
References: <1394999237-30259-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87d2hk4gqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > The --enable-xdf, --enable-vold, and --enable-new-vold options were
 > actually not being passed to ./configure since they were specified on
 > the wrong variable (MTOOLS_CONF_OPT vs. HOST_MTOOLS_CONF_OPT) and mtools
 > is a host-only package. Fixing the variable name so that the options are
 > actually used ends up causing the build to fail due to linker errors.
 > Since vold identifiers and OS/2 XDF support are unlikely to be used any
 > more, remove them completely.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
