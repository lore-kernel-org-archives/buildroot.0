From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sun, 8 May 2016 22:20:50 +0200
Subject: [Buildroot] [PATCH 22/34] High availability: add packages
In-Reply-To: <20160507223819.29dcfd5e@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-22-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507223819.29dcfd5e@free-electrons.com>
Message-ID: <20160508202050.GR13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 07, 2016 at 10:38:19PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 30 Apr 2016 09:49:18 +0200, Gilles Chanteperdrix wrote:
> > cluster-glue
> > corosync
> > heartbeat
> > libqb
> > pacemaker
> 
> This should be split in a series of patches, with one package per patch.

Please ignore this patch, the packages are not even fully integrated
and will not start automatically on boot. I did not intend to post it.

-- 
					    Gilles.
https://click-hack.org
