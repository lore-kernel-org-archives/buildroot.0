From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:38:46 +0200
Subject: [Buildroot] [PATCH] vnstat: needs host-pkgconf
In-Reply-To: <1460404192-28861-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460404192-28861-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160413213846.3485244b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Apr 2016 21:49:52 +0200, J?rg Krause wrote:
> vnstat uses the PKG_CHECK_MODULES macro and therefor requires pkg-config.

therefor -> therefore. I've fixed this when applying.

> 
> Note that for adding the dependency gd to VNSTAT_DEPENDENCIES the assignment
> was changed from '=' to '+='.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4dd/4ddb0d7d7fe2509ff9c4753d918e0bebd7725c13/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/vnstat/vnstat.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
