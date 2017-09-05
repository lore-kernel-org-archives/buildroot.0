From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:17:30 +0200
Subject: [Buildroot] [PATCH 1/1] pango: bump to 1.40.12
In-Reply-To: <20170905124044.jkofou54bfsm5dfs@tarshish>
References: <20170905122010.19409-1-aduskett@gmail.com>
 <20170905122010.19409-5-aduskett@gmail.com>
 <20170905124044.jkofou54bfsm5dfs@tarshish>
Message-ID: <20170905211730.6284d6ab@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Sep 2017 15:40:44 +0300, Baruch Siach wrote:
> Hi Adam,
> 
> On Tue, Sep 05, 2017 at 08:20:09AM -0400, Adam Duskett wrote:
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> >  .../0001-build-disable-tests-from-building.patch   | 28 +++++++++++-----------
> >  package/pango/pango.hash                           |  4 ++--
> >  package/pango/pango.mk                             |  2 +-
> >  3 files changed, 17 insertions(+), 17 deletions(-)
> > 
> > diff --git a/package/pango/0001-build-disable-tests-from-building.patch b/package/pango/0001-build-disable-tests-from-building.patch
> > index c518a34d3..51b645bae 100644
> > --- a/package/pango/0001-build-disable-tests-from-building.patch
> > +++ b/package/pango/0001-build-disable-tests-from-building.patch
> > @@ -1,16 +1,16 @@
> > -From cde9a78711e8eaed0aefb9e36288f22918e8d4b2 Mon Sep 17 00:00:00 2001
> > -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > -Date: Thu, 2 Mar 2017 09:41:41 -0300
> > -Subject: [PATCH] build: disable tests from building
> > +From 1c503a8b2f127c12e58a6e8ba01743c04061df50 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <aduskett@gmail.com>
> > +Date: Tue, 5 Sep 2017 07:25:17 -0400
> > +Subject: [PATCH] disable tests from building
> >  
> > -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > +Signed-off-by: Adam Duskett <aduskett@gmail.com>  
> 
> This patch refresh only touches the context, not a complete rewrite. Please 
> preserve the original subject, authorship and sign-off, and add your sign-off 
> below the original.

Agreed. Adam, could you fix and resend ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
