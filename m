From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:31:42 +0200
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: install Isolinux comboot
 modules
In-Reply-To: <1438267651-16818-2-git-send-email-nrubinstein@aldebaran.com>
References: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
 <1438267651-16818-2-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150730233142.482d7661@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Thu, 30 Jul 2015 16:47:31 +0200, No? Rubinstein wrote:
> This installs every module selected by the BR2_TARGET_SYSLINUX_C32.
> This is useful when using a custom Isolinux configuration file that may use
> comboot modules.
> 
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
>  fs/iso9660/iso9660.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
