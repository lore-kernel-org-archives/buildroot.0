From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:10:29 +0200
Subject: [Buildroot] [PATCH v2 1/2] iproute2: correct license
In-Reply-To: <7d39adcfed0fa70634aa025114ed8f2d7d9e68b3.1500489830.git.baruch@tkos.co.il>
References: <7d39adcfed0fa70634aa025114ed8f2d7d9e68b3.1500489830.git.baruch@tkos.co.il>
Message-ID: <20170719211029.7c277895@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 21:43:49 +0300, Baruch Siach wrote:
> Source files license headers include the GPL "or ... any later version" language.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: New patch split from the version bump
> ---
>  package/iproute2/iproute2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. Peter: this one should go in the
LTS/maintenance branches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
