From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:27:27 +0200
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: allow to build for
 aarch64 targets
In-Reply-To: <20170414214551.17986-2-gael.portay@savoirfairelinux.com>
References: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
 <20170414214551.17986-2-gael.portay@savoirfairelinux.com>
Message-ID: <20170415102727.07639073@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 17:45:50 -0400, Ga?l PORTAY wrote:
> The RaspberryPi 3 is based on a AArch64 CPU and requires binaries from
> this package.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/rpi-firmware/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
