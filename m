From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:51:42 +0100
Subject: [Buildroot] [PATCH 3/7] package/cairo: add optional support for
 lzo
In-Reply-To: <1456051888-2047-3-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
 <1456051888-2047-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221145142.217c3da1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 11:51:24 +0100, Bernd Kuhls wrote:
> When lzo was compiled before, cairo will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cairo-sphinx | grep NEEDED | sort
> [...]
>  0x0000000000000001 (NEEDED)             Shared library: [liblzo2.so.2]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've marked this patch as Changes Requested, following the feedback
from Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
