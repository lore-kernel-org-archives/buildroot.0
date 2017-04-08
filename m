From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:07:24 +0200
Subject: [Buildroot] [PATCH V2] beaglebone: increase size of ext4 more
 then 60MB
In-Reply-To: <20170408133703.18563-1-michael@amarulasolutions.com>
References: <20170408133703.18563-1-michael@amarulasolutions.com>
Message-ID: <20170408160724.606997f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 15:37:03 +0200, Michael Trimarchi wrote:
> This is due to the fact that we removed auto-calculation of the ext4
> filesystem size in
> https://git.buildroot.org/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358,
> and we default to 60 MB for the filesystem size, which is not enough
> for this demo
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  configs/beaglebone_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
