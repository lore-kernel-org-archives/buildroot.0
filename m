From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:17:45 +0200
Subject: [Buildroot] [PATCHv2 03/21] Makefile: targets are now declared
 phony by the appropriate infrastructures
In-Reply-To: <20150413194433.GC29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413194433.GC29025@free.fr>
Message-ID: <20150414101745.2cbd3213@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 13 Apr 2015 21:44:33 +0200, Yann E. MORIN wrote:

> Since you first posted that series, the 'list-defconfig' was introduced
> by Arnout, and your patch removes it from being a PHONY target, which it
> should be...
> 
> > -	$(TARGETS) $(TARGETS_ROOTFS) \
> > -	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)
> > +	target-finalize target-post-image
> 
> ... so should be kept in there.
> 
> When you fix that, you can keep my reviewd-by tag.

Wow, great, thanks for spotting! Obviously an incorrect rebase conflict
resolution on my side. I've fixed that up before applying the patch.
Thanks again for the thorough review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
