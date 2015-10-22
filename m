From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Thu, 22 Oct 2015 12:31:39 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/at: updated version from
	3.1.13 to 3.1.16
In-Reply-To: <20150920150838.1009ed2d@free-electrons.com>
References: <11269096.cxoRZRC0e7@deathstar> <1473000.Q0pm3JyGrD@deathstar>
 <20150920150838.1009ed2d@free-electrons.com>
Message-ID: <1913530.deddMt05TU@deathstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 20 September 2015 15:08:38 Thomas Petazzoni wrote:
> Dear Francesco Nwokeka,
> 
> On Tue, 08 Sep 2015 14:13:59 +0200, Francesco Nwokeka wrote:
> > Version 3 of the patch to update the "at" package.
> 
> You received some comments from Arnout Vandecappelle on September 8th
> on this patch. Could you take them into account and send an updated
> version of the patch?
> 
> I was going to apply by fixing the problems pointed by Arnout, but one
> requires a bit more work:
> 
> """
> > * Merged previous Makefile.in patches into one.  
> 
>  Ick, that's not what I intended! We want a separate patch file for each
> separate change. The two patches that you squashed into one do two
>  distinct changes:
> 
>  - change IROOT into DESTDIR
>  - don't try to install as root
> 
> So it's good to keep them separate.
> 
>  My proposal was to drop the first patch and just use IROOT. In
>  buildroot, we can easily use IROOT instead of DESTDIR by setting
> 
> AT_INSTALL_TARGET_OPTS = IROOT=$(TARGET_DIR) install
> """
> 
> Could you fix that and send a new version?


Hi Thomas!
	Sorry for the late reply but I've been 100% busy during this period. I'll get the patch back up and running ASAP. Sorry for the delay


Thanks,
	Francesco

> Thanks,
> 
> Thomas
> 
