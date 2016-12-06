From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 21:14:04 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: disallow 4.9.x for ARM cortex-a72
In-Reply-To: <20161206163618.1758-2-peter@korsgaard.com>
References: <20161206163618.1758-1-peter@korsgaard.com>
 <20161206163618.1758-2-peter@korsgaard.com>
Message-ID: <20161206211404.7a061433@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 17:36:18 +0100, Peter Korsgaard wrote:
> a72 support was only added in the 5.1 cycle.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gcc/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
