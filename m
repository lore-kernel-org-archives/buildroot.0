From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 12:48:12 +0100
Subject: [Buildroot] [PATCH] eeprog: fix homepage link
In-Reply-To: <5d4e572b6a29cdf484a8df1562993d68206022dd.1514719506.git.baruch@tkos.co.il>
References: <5d4e572b6a29cdf484a8df1562993d68206022dd.1514719506.git.baruch@tkos.co.il>
Message-ID: <20171231124812.2e20d6e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 13:25:06 +0200, Baruch Siach wrote:
> The current link leads to a 400 Bad Request error page.
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/eeprog/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. However, do we still need this package, now
that i2c-tools also builds/installs eeprog ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
