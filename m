From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:36:53 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: set
 CONFIG_RTL8821AU properly
In-Reply-To: <1468279527-17725-1-git-send-email-christian@paral.in>
References: <1468279527-17725-1-git-send-email-christian@paral.in>
Message-ID: <20160715193653.74208826@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 16:25:27 -0700, Christian Stewart wrote:
> Due to a recent update in the code, CONFIG_RTL8821AU=m is the expected
> kernel configuration environment variable to be set, not
> CONFIG_RTL8812AU_8821AU=m as was previously set.
> 
> Presently the package does effectively nothing.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rtl8821au/rtl8821au.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
