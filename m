From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 21:24:27 +0200
Subject: [Buildroot] [PATCH v1] domoticz: remove
 BR2_PACKAGE_BOOST_ARCH_SUPPORTS
In-Reply-To: <1469018268-1530-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469018268-1530-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160720212427.1341812d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Jul 2016 14:37:48 +0200, Fabrice Fontaine wrote:
> The option was globally removed with
> https://git.busybox.net/buildroot/commit/package/boost?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/domoticz/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
