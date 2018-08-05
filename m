From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:35:41 +0200
Subject: [Buildroot] [PATCH] package/glibc: remove --{with,
 without}-fp option
In-Reply-To: <20180801194729.6590-1-romain.naour@gmail.com>
References: <20180801194729.6590-1-romain.naour@gmail.com>
Message-ID: <20180805143541.3771c81c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 21:47:29 +0200, Romain Naour wrote:
> This option has been removed since glibc 2.27 [1].
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8df5d34720dd71e934545bade879e04697830757
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/glibc/glibc.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
