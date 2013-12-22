From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Dec 2013 10:59:23 +0100
Subject: [Buildroot] [PATCH] atk: bump to version 2.11.4
In-Reply-To: <1387699292.19488.1.camel@phoenix> (Axel Lin's message of "Sun,
 22 Dec 2013 16:01:32 +0800")
References: <1387699292.19488.1.camel@phoenix>
Message-ID: <87txe1fbpg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>
 > ---
 >  package/atk/atk.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/atk/atk.mk b/package/atk/atk.mk
 > index 1a8bbea..fc65987 100644
 > --- a/package/atk/atk.mk
 > +++ b/package/atk/atk.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -ATK_VERSION_MAJOR = 2.10
 > -ATK_VERSION = $(ATK_VERSION_MAJOR).0
 > +ATK_VERSION_MAJOR = 2.11
 > +ATK_VERSION = $(ATK_VERSION_MAJOR).4

odd minor version means development version. What is the reason we
cannot stick to the current stable version?

-- 
Bye, Peter Korsgaard
