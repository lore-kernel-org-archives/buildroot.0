From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Aug 2014 10:00:03 +0200
Subject: [Buildroot] [PATCH] lftp: add missing host-pkgconf dependency
In-Reply-To: <1409298708-16291-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 29 Aug 2014 09:51:48 +0200")
References: <1409298708-16291-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2bjraik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > lftp configure.ac uses PKG_CHECK_MODULES, so it must have host-pkgconf
 > in its dependency, otherwise the autoreconf step fails due to the lack
 > of pkg.m4.

 > Fixes:

 >   http://autobuild.buildroot.org/results/b16/b16d964f275d4d8703665236b969cc19f7ef20be/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
