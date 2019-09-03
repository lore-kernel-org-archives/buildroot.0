From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Sep 2019 22:58:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/unzip: add security patch from
 Debian
In-Reply-To: <20190903092024.20705-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 3 Sep 2019
 11:20:24 +0200")
References: <20190903092024.20705-1-sebastien.szymanski@armadeus.com>
Message-ID: <87h85t2j39.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > Fix the URL and add a new patch. Quoting changelog [1]:
 > unzip (6.0-25) unstable; urgency=medium

 >   * Apply one more patch by Mark Adler:
 >   - Do not raise a zip bomb alert for a misplaced central directory.
 >     This should allow Firefox to build again. Closes: #932404.
 >     Reported by Peter Green. Hopefully CVE-2019-13232 is fixed now.

 >  -- Santiago Vila <sanvila@debian.org>  Sat, 27 Jul 2019 18:01:36 +0200

 > [1] https://sources.debian.org/data/main/u/unzip/6.0-25/debian/changelog

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
