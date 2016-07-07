From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 11:49:47 +0200
Subject: [Buildroot] [PATCH] package/pulseaudio: remove WebRTC hook for
 toolchains without C++
In-Reply-To: <1467841855-28784-1-git-send-email-romain.naour@gmail.com>
References: <1467841855-28784-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160707114947.6b66822c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jul 2016 23:50:55 +0200, Romain Naour wrote:
> This hook is not required anymore since we handle WebRTC dependency
> with --enable/disable-webrtc-aec.
> 
> Also the hook doesn't have any effect since we use autoreconf because
> it should have been a POST_CONFIGURE_HOOKS.
> 
> So, we can remove it safely.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 15 ---------------
>  1 file changed, 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
