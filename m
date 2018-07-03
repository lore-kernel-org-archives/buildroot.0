From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:40:14 +0200
Subject: [Buildroot] [PATCH 1/2] kf5-modemmanager-qt: correct
 dependencies comment display conditions
In-Reply-To: <66fdce0c33ee33d5be7a51b8f94deb70b235a43a.1530637518.git.baruch@tkos.co.il>
References: <66fdce0c33ee33d5be7a51b8f94deb70b235a43a.1530637518.git.baruch@tkos.co.il>
Message-ID: <20180703214014.662f767f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Jul 2018 20:05:17 +0300, Baruch Siach wrote:
> Display the dependencies comment only when modem-manager is enabled.
> Otherwise, a toolchain configuration change would not make the package
> selectable.
> 
> Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/kf5/kf5-modemmanager-qt/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
