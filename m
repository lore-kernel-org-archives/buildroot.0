From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:38:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix systemd support
In-Reply-To: <20181124131526.30319-1-bernd.kuhls@t-online.de>
References: <20181124131526.30319-1-bernd.kuhls@t-online.de>
Message-ID: <20181125093833.11be4355@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 14:15:26 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/a09/a09a065c523931c1892e81a99c57521fbe095d8b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Fabrice Fontaine has contributed an improved version of this patch,
with a better implementation and commit log, so I've applied Fabrice's
solution: https://patchwork.ozlabs.org/patch/1002712/. Let me now if
you see any problem with Fabrice's patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
