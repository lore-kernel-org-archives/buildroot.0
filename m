From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:48:09 +0200
Subject: [Buildroot] [PATCH 1/3] support/download: remove help from
 wrapper
In-Reply-To: <29c0d6fb488dbaee0969d34df1193cc67a8c73e7.1533400367.git.yann.morin.1998@free.fr>
References: <cover.1533400367.git.yann.morin.1998@free.fr>
 <29c0d6fb488dbaee0969d34df1193cc67a8c73e7.1533400367.git.yann.morin.1998@free.fr>
Message-ID: <20180809234809.537446d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Aug 2018 18:33:03 +0200, Yann E. MORIN wrote:
> The download wrapper is a purely internal helper, and is not supposed to
> be callable manually. No need to offer some help.
> 
> Besides, the help text was way out-dated.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/dl-wrapper | 47 +--------------------------------------------
>  1 file changed, 1 insertion(+), 46 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
