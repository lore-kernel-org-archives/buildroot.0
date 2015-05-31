From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 09:06:54 +0200
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig
 and bootable microSD Bash script
In-Reply-To: <20150531041412.GB2282@tarshish>
References: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
 <20150529044005.GM2260@tarshish>
 <alpine.DEB.2.11.1505290930060.2289@tanhuma.tkos.co.il>
 <20150531041412.GB2282@tarshish>
Message-ID: <20150531090654.75ce4fb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Jonathan,

On Sun, 31 May 2015 07:14:12 +0300, Baruch Siach wrote:

> > I prefer to use the CC licenses, because they  are simpler, clearer, and
> > more appropriate to configuration files and scripts which are not compiled
> > or linked against, and they avoid both the heavy RMS idealogical baggage and
> > the legal confusions associated with the GPL licenses without any loss of
> > rights to the public.
> 
> The fact that all of Buildroot code itself is released under GPLv2 should make 
> life easier for downstream Buildroot distributors (and their legal 
> departments).
> 
> Anyway, in case Buildroot maintainers agree to accept scripts under a 
> different license, please add a patch to section 12.3 of the manual to clarify
> Buildroot license.

Since so far all of the Buildroot code (to the exception of the
patches, which are licensed under the respective license of the
software package they apply to) is under the GPLv2, I think we also
would like like such scripts to be licensed under the GPLv2. There is
no reason to have a different license for such scripts.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
