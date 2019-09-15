From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:57:34 +0200
Subject: [Buildroot] [PATCH] package/eudev: add missing user/groups
 "kvm" and "render"
In-Reply-To: <20190915123230.15954-1-unixmania@gmail.com>
References: <20190915123230.15954-1-unixmania@gmail.com>
Message-ID: <20190915155734.3185d090@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Sep 2019 09:32:30 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> They are required by the default udev rules.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12141
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/eudev/eudev.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
