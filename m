From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:11:12 +0100
Subject: [Buildroot] [PATCH] package/sysvinit: comment out login line in
 inittab if getty is disabled
In-Reply-To: <20191027130007.3006-1-unixmania@gmail.com>
References: <20191027130007.3006-1-unixmania@gmail.com>
Message-ID: <20191027141112.204849e1@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 10:00:07 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> When the "Run a getty" option is disabled, sysvinit doesn't remove the
> /etc/inittab line from previous builds. With this patch, the line is
> correctly commented out.
> 
> Based on similar change made by Stephen Bos <stephen.bos@hagergroup.com>
> and Christophe Blaess <christophe.blaess@logilin.fr> for busybox.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/sysvinit/sysvinit.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
