From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 22:10:06 +0100
Subject: [Buildroot] [PATCH] ne10: bump to version 1.2.0
In-Reply-To: <1426094134-48711-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 (Clayton Shotwell's message of "Wed, 11 Mar 2015 12:15:34 -0500")
References: <1426094134-48711-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <878uf3kzpt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clayton.shotwell@rockwellcollins.com> writes:

 > Bump to version 1.2.0, fixup patch, and add ensure package is installed
 > ot the staging directory.

 > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 > ---
 >  ...sts-don-t-hard-code-thumb-code-generation.patch | 26 ++++++++++++----------
 >  package/ne10/ne10.mk                               |  3 ++-
 >  2 files changed, 16 insertions(+), 13 deletions(-)

 > diff --git a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
 > index 3402b5a..3934587 100644
 > --- a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
 > +++ b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
 > @@ -1,27 +1,29 @@
 > -From 00995e0b8a66fbd0eabd206188120bfc1ecdac59 Mon Sep 17 00:00:00 2001
 > -Message-Id: <00995e0b8a66fbd0eabd206188120bfc1ecdac59.1398245232.git.baruch@tkos.co.il>
 > -From: Baruch Siach <baruch@tkos.co.il>
 > -Date: Wed, 23 Apr 2014 12:21:37 +0300
 > +From 9ff39800cec5f1dabba246b253794582d611bc6d Mon Sep 17 00:00:00 2001
 > +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

It's not really nice to change the authorship on the patch, so I Dropped
the change to the From: line and committed, thanks.

-- 
Bye, Peter Korsgaard
