From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 22:17:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/uclibc: backport static
 linking fixes
In-Reply-To: <20201006201124.GA463500@x230>
References: <20200909172547.380537-1-petr.vorel@gmail.com>
 <20201006212708.09b2698c@windsurf.home>
 <20201006201124.GA463500@x230>
Message-ID: <20201006221701.4af47dcd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 6 Oct 2020 22:11:24 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> > We now have updated to 1.0.36 in master, so this patch is no longer
> > needed in master.  
> Great, master is already updated.
> BTW how can I check that the toolchain already rebuilt?
> I'm asking for iproute2 fix which needs that:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200903155728.19448-2-petr.vorel at gmail.com/

The toolchains used in the autobuilders are at
http://autobuild.buildroot.net/toolchains/tarballs/. They were last
rebuilt with Buildroot 2020.02. I guess I should rebuild them when we
have 2020.11 ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
