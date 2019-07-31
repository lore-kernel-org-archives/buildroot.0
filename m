From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 00:02:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/unzip: update security and bux
 fix patches from Debian
In-Reply-To: <20190712133041.3611-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Fri, 12 Jul 2019
 15:30:41 +0200")
References: <20190712133041.3611-1-sebastien.szymanski@armadeus.com>
Message-ID: <87ef259819.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > Fix the URL and add three new patches. Quoting changelog [1]:
 > unzip (6.0-24) unstable; urgency=medium

 >   * Apply two patches by Mark Adler:
 >   - Fix bug in undefer_input() that misplaced the input state.
 >   - Detect and reject a zip bomb using overlapped entries. Closes: #931433.
 >     Bug discovered by David Fifield. For reference, this is CVE-2019-13232.

 >  -- Santiago Vila <sanvila@debian.org>  Thu, 11 Jul 2019 18:03:34 +0200

 > unzip (6.0-23) unstable; urgency=medium

 >   * Fix lame code in fileio.c which parsed 64-bit values incorrectly.
 >     Thanks to David Fifield for the report. Closes: #929502.

 >  -- Santiago Vila <sanvila@debian.org>  Wed, 29 May 2019 00:24:08 +0200

 > [1] https://sources.debian.org/data/main/u/unzip/6.0-24/debian/changelog

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
