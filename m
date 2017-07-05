From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 13:27:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/pulseaudio: remove kde files
In-Reply-To: <20170705112204.12442-1-romain.naour@smile.fr>
References: <20170705112204.12442-1-romain.naour@smile.fr>
Message-ID: <20170705132743.5b776e55@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 13:22:03 +0200, Romain Naour wrote:
> Upstream removed the src/daemon/pulseaudio-kde.desktop.in since the
> version 6.0 [1].
> 
> [1] https://github.com/pulseaudio/pulseaudio/commit/f46799579f438125b695dced4edf8bca05cbe90a
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/pulseaudio/pulseaudio.mk | 2 --
>  1 file changed, 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
