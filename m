From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:00:00 +0200
Subject: [Buildroot] [PATCH] linux-zigbee: fix build with gcc 7
In-Reply-To: <dec68ad1059ce87fa42de8b4c15f44d532ad6201.1500588272.git.baruch@tkos.co.il>
References: <dec68ad1059ce87fa42de8b4c15f44d532ad6201.1500588272.git.baruch@tkos.co.il>
Message-ID: <20170721090000.1ca3afcd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 01:04:32 +0300, Baruch Siach wrote:
> Disable -Werror to avoid the fatal result of new gcc 7 format string warnings.
> 
> Fixes:
> http://autobuild.buildroot.net/results/29c/29c72bc38042305310576be945c721b2fad95894/
> http://autobuild.buildroot.net/results/a7d/a7d38d72834b94291eaff159da277b11e2f9d63a/
> http://autobuild.buildroot.net/results/cfe/cfed5176075f0cb9e2f56ebef10f5d6c352baf10/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/linux-zigbee/linux-zigbee.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
