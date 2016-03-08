From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:19:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: add optional
 dependencies to libgl, libvpx and opus
In-Reply-To: <1453065500-26441-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453065500-26441-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160308211958.4ef27b63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 17 Jan 2016 22:18:20 +0100, Bernd Kuhls wrote:
> Mplayer links to these packages when present:
> 
> output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mplayer | grep NEEDED | grep "opus\|vpx\|GL"
>  0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libvpx.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libGL.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
