From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 23:23:53 +0100
Subject: [Buildroot] [PATCH] pv: fix minisetlocale related build failure
In-Reply-To: <1392934315-27932-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Feb 2014 23:11:55 +0100")
References: <1392934315-27932-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ha7twhhi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > pv configure script is somewhat stupid: if it cannot find the host
 > gettext tool msgfmt, it concludes that gettext is not available, and
 > provides its own minimal version. Unfortunately, this minimal version
 > conflicts with the available target gettext. We fix this by ensuring
 > that host-gettext is built if gettext support is enabled, by adding it
 > to the dependencies.

 > Fixes:

 >   http://autobuild.buildroot.org/results/d30/d30db79190f2cf8953751d55a5d34644f60daec4/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
