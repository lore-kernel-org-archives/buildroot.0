From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:22:12 +0100
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support
 selectable
In-Reply-To: <20170220221444.4792d09a@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-3-ps.report@gmx.net>
 <20170220220434.728a8a89@free-electrons.com>
 <20170220221444.4792d09a@gmx.net>
Message-ID: <20170220222212.458f5c7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 22:14:44 +0100, Peter Seiderer wrote:

> This patch is a follow up on your (and Arnout's) suggestion to prefer
> system libraries, freetype first, harzbuzz second..., so logically it
> belongs to the freetype patch...
> 
> But no mandatory need for this patch to be applied to master, maybe
> next is enough...
> 
> At the moment always the qt built-in harfbuzz is used...

OK. The freetype one was really needed in master as it was fixing a
build issue.

However, I'll keep the harfbuzz patch around until next gets merged
back into master after the release. We've been building Qt with the
internal harfbuzz so far, so let's keep it this way for the release.

Are you also looking at the other qt5 failures on various
architectures?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
