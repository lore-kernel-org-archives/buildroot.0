From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 21:24:51 +0100
Subject: [Buildroot] [PATCH v2] pandaboard_defconfig: bump u-boot to
 2015.10 and kernel to 4.3
In-Reply-To: <1452250251-9442-1-git-send-email-sergio.prado@e-labworks.com>
References: <1452250251-9442-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160206212451.21d0b116@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Fri,  8 Jan 2016 08:50:51 -0200, Sergio Prado wrote:
> VFPv3 and NEON was enabled and a readme.txt file was added.
> 
> Fixes bug #7580.
> 
> Tested on Pandaboard ES.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Thanks for this patch. Could you rebase it on master ? All defconfigs
have been touched by a recent change from Yann E. Morin.

Note that all defconfigs should now use the "use kernel headers from
kernel" mechanism. See
https://git.busybox.net/buildroot/commit/?id=674e09967818bf49fd1b6bf1f986a4c0f917fa63.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
