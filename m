From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 23:38:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version
In-Reply-To: <2ltubexjp9.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sun, 22 Oct 2017 18:29:54 +0200")
References: <20171022152343.19014-1-bernd.kuhls@t-online.de>
 <20171022174903.33717136@windsurf>
 <2ltubexjp9.ln2@ID-313208.user.individual.net>
Message-ID: <87o9oyamni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Sun, 22 Oct 2017 17:49:03 +0200 schrieb Thomas Petazzoni:
 >> Bumping from a random Git commit, to another random Git commit, without
 >> any explanation.
 >> 
 >> I've applied. But next time, without an explanation, I won't.

 > Hi Thomas,

 > upstream does not provide releases with version numbers:
 > https://www.videolan.org/developers/x264.html

 > I try to bump the package once during each buildroot release cycle. Do 
 > you consider this explanation sufficient?

Still, it would be good if there would be some more background
information about why this new version is an improvement (E.G. a short
summary of the new features or bugfixes) or doesn't introduce any big
regressions (E.G. information about how you have tested it).

This kind of information is useful to understand how risky it is
(E.G. we are getting close to rc1 time) or if it should also be
backported to 2017.08.x / 2017.02.x

-- 
Bye, Peter Korsgaard
