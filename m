From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:53:55 +0200
Subject: [Buildroot] [PATCH] lua: use target LDFLAGS
In-Reply-To: <6d72098cd529e9364107dd2727d22eda57635c80.1494253706.git.baruch@tkos.co.il>
References: <6d72098cd529e9364107dd2727d22eda57635c80.1494253706.git.baruch@tkos.co.il>
Message-ID: <20170511215355.7120fedb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 17:28:26 +0300, Baruch Siach wrote:
> This adds '-static' to the link command when BR2_STATIC_LIBS=y, making the lua
> binary really static.
> 
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lua/lua.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
