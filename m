From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:21:00 +0100
Subject: [Buildroot] [PATCH 01/10] package/gnuradio: add optional
 support for orc
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160223222100.674aba5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:34:50 +0100, Bernd Kuhls wrote:
> When orc was compiled before, gnuradio will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/gnuradio-config-info | grep NEEDED
> [...]
>  0x0000000000000001 (NEEDED)             Shared library: [liborc-0.4.so.0]
> [...]
> 
> Apparently there is no option provided by the build system to
> en-/disable support for orc:
> https://github.com/gnuradio/volk/blob/41b4df055b2c8d4f2c23ad2bdc60c0b47b4f0dd8/lib/CMakeLists.txt#L449
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnuradio/gnuradio.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks!

Thanks to Gwenhael for testing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
