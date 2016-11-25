From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:02:37 +0100
Subject: [Buildroot] [PATCH] odroid-scripts: init display as early as
 possible
In-Reply-To: <20161125074846.9647-1-daggs@gmx.com>
References: <20161125074846.9647-1-daggs@gmx.com>
Message-ID: <20161125220237.35c4161c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 09:48:46 +0200, Dagg Stompler wrote:
> this commit will init the display as early as possible so the user can
> see on screen the boot process.
> the displey init will be called after the logging init to provide some
> logging of the init.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/odroid-scripts/{S50odroidc2_fb => S02odroidc2_fb} | 0
>  package/odroid-scripts/odroid-scripts.mk                  | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/odroid-scripts/{S50odroidc2_fb => S02odroidc2_fb} (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
