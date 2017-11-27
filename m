From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:56:39 +0100
Subject: [Buildroot] [git commit] lttng-tools: fix build errors and
 warnings for musl/uClibc-ng
In-Reply-To: <20171123200156.0A08281496@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 23 Nov 2017 21:08:48 +0100")
References: <20171123200156.0A08281496@busybox.osuosl.org>
Message-ID: <87lgisavu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9dd25fe977867a2e7ef1ba40c3cbd12953ecaf51
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add 0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch to
 > detect if dlmopen() exists and disable parts of the build accordingly if
 > not. This fixes a bug when building with musl or uClibc-ng.

 > Add 0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch to
 > fix an #include bug when building with musl.

 > Add 0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch to
 > remove compilation warnings.

 > All three new patches are in upstream's master branch as of this date
 > and will be part of an eventual release.

 > Fixes:

 >   http://autobuild.buildroot.net/results/e37a5c69e2a9f9cd7c0705331e205c1ee20808e7/
 >   (musl)

 >   http://autobuild.buildroot.net/results/b2670e6d1928649aefa7fbc748858e6036585f01/
 >   (uclibc)

 > Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
