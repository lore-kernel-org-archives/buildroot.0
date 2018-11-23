From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:46:05 +0100
Subject: [Buildroot] [PATCH v1] alsa-utils: add optional systemd
 dependency
In-Reply-To: <20181121220102.10580-1-ps.report@gmx.net>
References: <20181121220102.10580-1-ps.report@gmx.net>
Message-ID: <20181123104605.50f7cbb7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 23:01:02 +0100, Peter Seiderer wrote:
> Fixes (reported by Yann E. MORIN, [1]):
> 
> /usr/bin/install -D -m 0644 .../build/alsa-utils-1.1.6/alsactl/alsa-restore.service .../target/usr/lib/systemd/system/alsa-restore.service
> /usr/bin/install: cannot stat '.../build/alsa-utils-1.1.6/alsactl/alsa-restore.service': No such file or directory
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2018-November/236355.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/alsa-utils/alsa-utils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
