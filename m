From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 15:32:08 +0200
Subject: [Buildroot] [PATCH 1/1] beaglebone_qt5_defconfig: use gcc 5.x
In-Reply-To: <1502450164-3015-1-git-send-email-lothar.felten@gmail.com>
References: <1502450164-3015-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20170811153208.19609eb2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Aug 2017 13:16:04 +0200, Lothar Felten wrote:
> The linux 4.1 kernel does not compile with gcc 6.x.
> The compiler version is now fixed to 5.x until a new kernel is used.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  configs/beaglebone_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
