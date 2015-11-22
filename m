From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:47:13 +0100
Subject: [Buildroot] [PATCH/next 1/8] package/boost: bump version to
	1.59.0
In-Reply-To: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 21 Nov 2015 20:40:28 +0100")
References: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87bnal671a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patch applied upstream.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  .../boost/0002-gcc.jam-compiler-options-fix.patch  | 37 ----------------------
 >  package/boost/boost.hash                           |  6 ++--
 >  package/boost/boost.mk                             |  2 +-
 >  3 files changed, 4 insertions(+), 41 deletions(-)
 >  delete mode 100644 package/boost/0002-gcc.jam-compiler-options-fix.patch

The release notes state:

Known Issue

    Boost.Log contains has a regression that prevents some of the
    logging statements from compiling (#11549). This is fixed in git.

New Libraries

    Convert: An extendible and configurable type-conversion framework, from Vladimir Batov.
    Coroutine2: (C++14) Coroutine library, from Oliver Kowalke.

But I don't see a fix for that Boost.log issue and no new Config.in
options for the new libraries?

-- 
Bye, Peter Korsgaard
