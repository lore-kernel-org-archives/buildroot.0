From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 07:51:48 +0100
Subject: [Buildroot] [PATCH v2] libroxml: bump version to 2.3.0
In-Reply-To: <1391296063-10950-1-git-send-email-blunderer@blunderer.org>
 (blunderer@blunderer.org's message of "Sat, 1 Feb 2014 15:07:43
 -0800")
References: <1391189802-5284-1-git-send-email-blunderer@blunderer.org>
 <1391296063-10950-1-git-send-email-blunderer@blunderer.org>
Message-ID: <8738k2roqj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "blunderer" == blunderer  <blunderer@blunderer.org> writes:

 > From: Tristan Lelong <tristan.lelong@blunderer.org>
 > Starting with version 2.3.0, libroxml is now using autotools.
 > With autotools, the -Werror flag was dropped
 -> no need for the patch libroxml-0001-werror.patch
 > With autotools, the availability of -Wno-*-unused is auto detected
 -> no need for the patch libroxml-0002-wno-unused-result.patch

 > Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
