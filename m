From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 19:59:02 +0200
Subject: [Buildroot] [PATCH v3] xfsprogs: bump to 4.16.1
In-Reply-To: <1525891276-6111-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 9 May 2018 13:41:16 -0500")
References: <1525891276-6111-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <878t85nfo9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Resolves build failures like:
 > http://autobuild.buildroot.net/results/953/95307f0f56c7ead1bd1f0ab0049aeb8b30fdc11c/

 > libunistring to libicu conversion required modifications to
 > 0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch and
 > the libicu usage doesn't require the
 > 0005-xfs_scrub-fix-cross-compile-with-libunistring.patch patch. I
 > verified that the configuration time setup of the LIBICU library
 > works correctly and doesn't require us to remove it.

 > Upstream has reworked/included the following:
 > 0003-workqueue-add-missing-pthreads-header.patch
 > 0004-xfs_scrub-add-missing-paths-header.patch
 > 0006-xfs_scrub-fix-build-with-older-kernel-headers.patch

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---

 > Changes
 > v2 -> v3
 > [Baurch
 >  - Add --{enable,disable}-libicu to XFSPROGS_CONF_OPTS

 > v1 -> v2
 > [Baurch/Thomas P
 >  - Add back in the option to support a unicode library (libicu)

Committed, thanks.

-- 
Bye, Peter Korsgaard
