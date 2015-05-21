From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 22:56:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: Add libuuid as optional
 dependency
In-Reply-To: <1432228748-24980-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432228748-24980-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150521225645.13d2188b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 21 May 2015 19:19:08 +0200, Bernd Kuhls wrote:
> libuuid is picked up by apr when present:
> 
> Checking for OS UUID Support...
> checking uuid/uuid.h usability... yes
> checking uuid/uuid.h presence... yes
> checking for uuid/uuid.h... yes
> checking for library containing uuid_generate... -luuid
> checking for uuid_generate... yes
> checking for os uuid usability... yes
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libapr-1.so | grep libuuid
>  0x00000001 (NEEDED)                     Shared library: [libuuid.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr/apr.mk |    5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
