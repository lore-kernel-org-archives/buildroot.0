From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:30:18 +0100
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: fix libunwind on
 MIPS with 32-bit pointers
In-Reply-To: <1424023859-37365-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424023859-37365-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150219223018.0aeeb549@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sun, 15 Feb 2015 18:10:58 +0000, Vicente Olivert Riera wrote:
> Adding a patch to fix a compilation problem of Xorg + libunwind support
> when building it on MIPS variants with 32-bit pointers.
> 
> Related:
> 
>   http://lists.busybox.net/pipermail/buildroot/2014-December/114404.html
> 
> Patch submitted upstream:
> 
>   http://lists.x.org/archives/xorg-devel/2015-January/045226.html
> 
> Patch reviewed by an Xorg developer:
> 
>   http://lists.x.org/archives/xorg-devel/2015-January/045383.html
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/87b/87be2c95957f9925c1258812e536df72689fc5da/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Both patches applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
