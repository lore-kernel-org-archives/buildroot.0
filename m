From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 21:04:19 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/gcc: fix build of
 gcc-7.3.0 with
In-Reply-To: <ae19c065-5ce3-a333-173d-388612659cc3@t-online.de>
References: <20180812172909.21450-1-bernd.kuhls@t-online.de>
 <ae19c065-5ce3-a333-173d-388612659cc3@t-online.de>
Message-ID: <20180812210419.78125b1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 20:10:43 +0200, Bernd Kuhls wrote:

> > What about the older gcc versions we support ?  
> 
> upstream has no patches for these versions:

Does this mean the problem doesn't exist, or just that the gcc
developers didn't backport the patch ?

Could you do a test build of gcc 6.x and glibc 2.28 ? Or perhaps verify
in the source code that the problem didn't exist back then ?

> > or1k-musl-5.4.0-20170218  
> 
> Could not find an upstream branch at gcc.gnu.org.

This is not an official upstream branch, but if the upstream 5.4.0 is
affected by the issue, the patch should apply just as well to this
branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
