From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 20:38:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 6.0.0
In-Reply-To: <1461857995-21875-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Thu, 28 Apr 2016 16:39:55 +0100")
References: <1461857995-21875-1-git-send-email-martin@barkynet.com>
Message-ID: <87r3dpwpci.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > See https://nodejs.org/en/blog/release/v6.0.0/
 > The patches from 5.11.0 have been copied to 6.0.0 with the following
 > changes:

 >  - Removed 0001-Remove-dependency-on-Python-bz2-module.patch,
 >    0003-Fix-va_list-not-declared.patch and
 >    0004-Fix-support-for-uClibc-ng.patch as all 3 have been fixed upstream
 >  - Renamed 0002-gyp-force-link-command-to-use-CXX.patch to
 >    0001-gyp-force-link-command-to-use-CXX.patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
