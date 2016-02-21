From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:47:54 +0100
Subject: [Buildroot] [PATCH 01/14] package/patch: add optional support
 for attr
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221124754.7e68f516@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 10:50:05 +0100, Bernd Kuhls wrote:
> When attr was compiled before, patch will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/patch | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libattr.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/patch/patch.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

I've applied all fourteen patches as-is to the master branch, except
PATCH 12/14. I'll reply to it separately.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
