From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:22:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix mips compile
In-Reply-To: <1437761628-4558-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437761628-4558-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150726152230.4dc025e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 24 Jul 2015 20:13:47 +0200, Bernd Kuhls wrote:
> buildroot has no support for msa, CONFIG_CPU_HAS_MSA is not enabled in
> kernel config.
> 
> Fixes
> http://autobuild.buildroot.net/results/030/03055aa696e9e885baabb43fff613d751974a4b7//
> http://autobuild.buildroot.net/results/6b5/6b5c13c949e8ae23f1b58c6da4002371130e9bb3//
> http://autobuild.buildroot.net/results/1af/1af3c68bc21503438fb0066f5e51e82e35a5442b//
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk |    1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
