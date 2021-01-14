From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:37:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: bump to version
 3.0.0
In-Reply-To: <20210112222807.1649810-1-joerg.krause@embedded.rocks>
References: <20210112222807.1649810-1-joerg.krause@embedded.rocks>
Message-ID: <20210114223717.04b89d80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2021 23:28:07 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop upstream patch which is included in the new version.
> 
> Add additional config option `--enable-a2dpconf` to build small (13 kB)
> utility `a2dpconf` which does not depend on any external dependencies.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-fix-build-issue-with-gcc-10.patch    | 140 ------------------
>  package/bluez-alsa/bluez-alsa.hash            |   2 +-
>  package/bluez-alsa/bluez-alsa.mk              |   3 +-
>  3 files changed, 3 insertions(+), 142 deletions(-)
>  delete mode 100644 package/bluez-alsa/0001-fix-build-issue-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
