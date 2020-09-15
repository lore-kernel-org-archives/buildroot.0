From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:48:09 +0200
Subject: [Buildroot] [PATCH v1 1/5] package/runc: bump to version
 1.0.0-rc92
In-Reply-To: <20200913001659.472814-1-christian@paral.in> (Christian Stewart's
 message of "Sat, 12 Sep 2020 17:16:54 -0700")
References: <20200913001659.472814-1-christian@paral.in>
Message-ID: <87k0wuswpi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/runc/runc.hash | 2 +-
 >  package/runc/runc.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/runc/runc.hash b/package/runc/runc.hash
 > index b895f6fccb..d792947d5f 100644
 > --- a/package/runc/runc.hash
 > +++ b/package/runc/runc.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256	6b44985023347fb9c5a2cc6f761df8c41cc2c84a7a68a6e6acf834dff6653a9a  runc-1.0.0-rc10.tar.gz
 > +sha256	28378df983a3c586ed3ec8c76a774a9b10f36a0c323590a284b801cce95cc61f  runc-1.0.0-rc92.tar.gz
 >  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
 > diff --git a/package/runc/runc.mk b/package/runc/runc.mk
 > index aedfb5ef9e..3d177d23d5 100644
 > --- a/package/runc/runc.mk
 > +++ b/package/runc/runc.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -RUNC_VERSION = 1.0.0-rc10
 > +RUNC_VERSION = 1.0.0-rc92

rc91 contained a (low severity) security fix:
https://github.com/opencontainers/runc/security/advisories/GHSA-g54h-m393-cpwq

and rc92 contained a fix for a regression introduced in rc91, so I've
adjusted the commit message to make this clear and committed to
2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
