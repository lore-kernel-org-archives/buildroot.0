From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:51:23 +0100
Subject: [Buildroot] [PATCH 2/2] odroidc2: use first boot fs resize pkg.
In-Reply-To: <20161202101028.26736-2-daggs@gmx.com>
References: <20161202101028.26736-1-daggs@gmx.com>
 <20161202101028.26736-2-daggs@gmx.com>
Message-ID: <20161217165123.1053e588@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Dec 2016 12:10:28 +0200, Dagg Stompler wrote:
> remove the hardcode limitation of the created rootfs parition size and
> use the newly added first boot fs resize pkg to extend the fs to the max
> possible.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

I think we want to decide if we want to do this globally for all
defconfig for which it makes sense. Having that just for one defconfig,
but not all the other is a bit weird. Being consistent is quite
important.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
