From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:51:41 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.14.x and 4.{4,
 5}.x series
In-Reply-To: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160522225141.7e1f9528@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 10:25:36 -0300, Gustavo Zacarias wrote:
> Kernel headers 4.5 -> 4.5.4 broke netfilter uapi headers leading to
> build failures for cases where glibc's net/if.h was included before
> linux/if.h
> This is fixed since 4.5.5 via linux kernel commit 4a91cb61 and fixes:
> http://autobuild.buildroot.net/results/736/7362431f62ebb1b436ac41ea3ef85228c763e6f3/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-headers/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Both patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
