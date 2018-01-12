From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:10:03 +0100
Subject: [Buildroot] [PATCH] system/Config.in: hide
 BR2_TARGET_GENERIC_GETTY_{TERM, OPTIONS} with systemd
In-Reply-To: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
References: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20180112221003.49731514@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Jan 2018 23:14:02 +0100, Thomas Petazzoni wrote:
> When systemd is used as the init system, the
> BR2_TARGET_GENERIC_GETTY_TERM and BR2_TARGET_GENERIC_GETTY_OPTIONS are
> completely ignored, which might confuse the user, as reported in bug
> 
> For now, let's simply make those options visible only with busybox
> init and sysv init, as suggested by Yann E. Morin in the discussion of
> bug #10301.
> 
> Fixes #10301.
> 
> Reported-by: Michael Heinemann <posted@heine.so>
> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  system/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied, after taking into account the feedback from Yann about
the wording of the commit title and commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
