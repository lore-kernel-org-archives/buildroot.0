From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 21:14:53 +0100
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <20180213195449.51516-2-chris.brandt@renesas.com>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
Message-ID: <20180213211453.519b65eb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for doing this work on cramfs!

On Tue, 13 Feb 2018 14:54:48 -0500, Chris Brandt wrote:
> As of Linux-4.15, cramfs now has a official maintainer again.
> Additionally, that person is hosting and maintaining a new version of
> cramfs-tools.
> 
> The 0003-fix-missing-types.patch is no longer needed because that fix
> is already included.
> 
> However, since patches 0001-endian.patch and 0002-cygwin_IO.patch are
> so old, they are being removed until someone that needs them can
> reapply and test them. At that point, they should submit the changes
> to the new cramfs-tools maintainer instead of adding the patches back
> here.

Do you know how endianess if handled by cramfs with the more recent
version of the cramfs tools ?

Other than that, the patches look good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
