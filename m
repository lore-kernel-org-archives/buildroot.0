From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:39:00 +0200
Subject: [Buildroot] [PATCH] package/madplay: add custom libtool patch
In-Reply-To: <20170530145317.9552-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 30 May 2017 16:53:17 +0200")
References: <20170530145317.9552-1-romain.naour@gmail.com>
Message-ID: <8760gfixh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Madplay use a libtool script version 1.5.2 but the libtool patch
 > "buildroot-libtool-v1.5.patch.patch" doesn't apply.

 > From [1]:
 > "It's libtool dropping -static. That's because madplay has a
 > weird version of libtool, on which our libtool patch doesn't apply so
 > we have MADPLAY_LIBTOOL_PATCH = NO. Therefore, the hack we have that
 > makes libtool -static behave like -all-static isn't applied, causing
 > this build failure."

 > Fixes:
 > http://autobuild.buildroot.net/results/60def1b15ea61d3cb5f50e9de3f354dd2e17d270

 > [1] http://lists.busybox.net/pipermail/buildroot/2017-May/192959.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
