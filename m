From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:37:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: Fix compiling VFP
 assembler code
In-Reply-To: <20160906102909.17812-1-bernd.kuhls@t-online.de>
References: <20160906102909.17812-1-bernd.kuhls@t-online.de>
Message-ID: <20160906213746.63e0580b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Sep 2016 12:29:09 +0200, Bernd Kuhls wrote:
> Fixes build errors in ffmpeg
> http://autobuild.buildroot.net/results/c32/c32a21240a9933796ee850349a62ff3c2314f25c/
> http://autobuild.buildroot.net/results/22a/22a9769d83d2a398bb6b264d342b2077c41c9cc5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ypes_c.h-Fix-compiling-VFP-assembler-code.patch | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch

Thanks a lot for pushing the investigation a bit further and fixing the
original problem! Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
