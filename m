From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:43:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: use
 BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <20170415102236.10720-1-bernd.kuhls@t-online.de>
References: <20170415102236.10720-1-bernd.kuhls@t-online.de>
Message-ID: <20170416104354.5fec6fde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 12:22:36 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/69d/69d33792f2e7ec62bfe593eb4bbc8fb2652d7011/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
