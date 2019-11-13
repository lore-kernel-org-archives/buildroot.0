From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2019 20:15:28 +0100
Subject: [Buildroot] [PATCH 03/11] package/dropwatch: license is GPL-2.0+
In-Reply-To: <87imnneol1.fsf@tarshish> (Baruch Siach's message of "Wed, 13 Nov
 2019 18:19:22 +0200")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-4-peter@korsgaard.com> <87imnneol1.fsf@tarshish>
Message-ID: <87eeybk2pb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Wed, Nov 13 2019, Peter Korsgaard wrote:

 >> Dropwatch links with readline, which is GPL-3.0+, so not compatible with
 >> GPL-2.0.  When asked about this, upstream has clarified that the license
 >> really is GPL-2.0+:
 >> 
 >> https://github.com/nhorman/dropwatch/issues/14
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/dropwatch/dropwatch.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
 >> index 1af61458e0..53d3683c5a 100644
 >> --- a/package/dropwatch/dropwatch.mk
 >> +++ b/package/dropwatch/dropwatch.mk
 >> @@ -7,7 +7,7 @@
 >> DROPWATCH_VERSION = 1.5.1
 >> DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 >> DROPWATCH_DEPENDENCIES = libnl readline host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 >> -DROPWATCH_LICENSE = GPL-2.0
 >> +DROPWATCH_LICENSE = GPL-2.0+

 > Maybe add a link to upstream license clarification in a comment?

True, lets do that when committing. Upstream has not actually made any
changes to the repo yet though.

-- 
Bye, Peter Korsgaard
