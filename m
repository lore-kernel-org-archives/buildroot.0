From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jun 2016 09:46:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/zyre: update license
In-Reply-To: <1465189080-6604-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Mon, 6 Jun 2016 06:58:00 +0200")
References: <1465189080-6604-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <8737oqkbdd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The project switched to MPLv2.0:
 > https://github.com/zeromq/zyre/issues/327

 > Fixes
 > http://autobuild.buildroot.net/results/88f/88fa0b150ad83e42625666cbffdf95ee178015cb/

Heh, that will teach me. I ran <foo>-legal-info for all of your 28
patches, EXCEPT for zyre ;)

Committed, thanks.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/zyre/zyre.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
 > index b17dfd0..86378df 100644
 > --- a/package/zyre/zyre.mk
 > +++ b/package/zyre/zyre.mk
 > @@ -6,8 +6,8 @@
 
 >  ZYRE_VERSION = a351468b7d313fc90c446668122365851a9c60e4
 >  ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 > -ZYRE_LICENSE = LGPLv3+

Notice that the patch as written here is wrong, as commit
a351468b7d313fc90c446668122365851a9c60e4 still was LGPL. Please base
your patches on HEAD.

-- 
Bye, Peter Korsgaard
