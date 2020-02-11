From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:55:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump version to 6.9
In-Reply-To: <CAG=Azd-zWTxrtypciUHCtLZ7_xWgPDpprD2qZ=qqE2=5PKXWXw@mail.gmail.com>
 (Wesley Chow's message of "Sat, 8 Feb 2020 17:38:59 -0500")
References: <CAG=Azd-zWTxrtypciUHCtLZ7_xWgPDpprD2qZ=qqE2=5PKXWXw@mail.gmail.com>
Message-ID: <87eev0hgy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wesley" == Wesley Chow <wes@cortico.ai> writes:

 > Fixes high rngd startup latency along with other minor bugs:
 > https://github.com/nhorman/rng-tools/releases/tag/v6.9

 > Signed-off-by: Wesley Chow <wes.chow@gmail.com>

Your patch was unfortunately badly word wrapped / white space corrupted,
so I had to fix it up manually. Please consider using git send-email in
the future.

Committed, thanks.

 > ---
 > package/rng-tools/rng-tools.hash | 2 +-
 > package/rng-tools/rng-tools.mk   | 2 +-
 > 2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/rng-tools/rng-tools.hash
 > b/package/rng-tools/rng-tools.hash
 > index 5989d9f022..c4bc11e89f 100644
 > --- a/package/rng-tools/rng-tools.hash
 > +++ b/package/rng-tools/rng-tools.hash
 > @@ -1,3 +1,3 @@
 > # Locally computed
 > -sha256 93e548d4aaf2a1897d4b677f41d8473db1c7f57648adeca18cafa1907e410bb3
 >  rng-tools-6.8.tar.gz
 > +sha256  a57a7f51a2e3c0faa8afb979709a4c0cbea36d0b52fd835b104f8fb4fd1fa610
 >  rng-tools-6.9.tar.gz
 > sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 >  COPYING
 > diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
 > index 274079044c..5338e95590 100644
 > --- a/package/rng-tools/rng-tools.mk
 > +++ b/package/rng-tools/rng-tools.mk
 > @@ -4,7 +4,7 @@
 > #
 > ################################################################################

 > -RNG_TOOLS_VERSION = 6.8
 > +RNG_TOOLS_VERSION = 6.9
 > RNG_TOOLS_SITE = $(call
 > github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 > RNG_TOOLS_LICENSE = GPL-2.0
 > RNG_TOOLS_LICENSE_FILES = COPYING
 > --
 > 2.17.1
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
