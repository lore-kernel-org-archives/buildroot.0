From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 30 Oct 2008 15:04:19 +0100
Subject: [Buildroot] [PATCH 6/9] Ask the kernel source where it will
 install modules
In-Reply-To: <20081030142018.1377e1b1@surf>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203246.15826.56394.stgit@localhost.localdomain>
	<20081030142018.1377e1b1@surf>
Message-ID: <20081030150419.2b9bff9f@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Oct 2008 14:20:18 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Le Thu, 16 Oct 2008 14:32:46 -0600,
> Grant Likely <grant.likely@secretlab.ca> a ?crit :
> 
> > Originally, $(LINUX26_VERSION) was used to figure out which
> > directory modules would get installed in under /lib/modules.  This
> > causes problems when $(LINUX26_VERSION) differs from what version
> > the kernel source thinks it is using because it will try to use
> > depmod in the wrong directory.
> 
> Just for curiosity, in what cases $(LINUX26_VERSION) can differ from
> the ? version the kernel source thinks it is using ? ?
> 
> Otherwise, the version proposed by Hans-Christian Egtvedt looks good
> to me.
> 

Committed as r23858, and sorry I forgot to add Grant Likely as
author :/

-- 
Best regards,
Hans-Christian Egtvedt
