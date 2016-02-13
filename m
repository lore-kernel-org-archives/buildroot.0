From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 16:42:32 +0100
Subject: [Buildroot] [PATCH] package/pulseaudio: remove musl fix
In-Reply-To: <1455368868-25728-1-git-send-email-romain.naour@gmail.com>
References: <1455368868-25728-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160213164232.3c2de846@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 13 Feb 2016 14:07:48 +0100, Romain Naour wrote:
> A recent change in puseaudio 8.0 [1] removed the nonstandard
> __WORDSIZE define. So 0002-musl-fixes.patch is not needed
> anymore.
> 
> Also remove PULSEAUDIO_AUTORECONF.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dc6/dc6642b18a97f6e0ac1524fe836226a7ee23df86
> 
> [1] https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=7c1a5d61597b8a7b762f8295c7d791942dba3fb5
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> The fix was needed with pulseaudio 7.0 and I missed
> that It wasn't needed with pulseaudio 8.0 while reviewing
> Bernd's patch.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
