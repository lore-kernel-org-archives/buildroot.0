From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:41:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libsrtp: fix license hash
In-Reply-To: <20180820173348.10155-1-bernd.kuhls@t-online.de>
References: <20180820173348.10155-1-bernd.kuhls@t-online.de>
Message-ID: <20180820224100.5235a70c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 19:33:48 +0200, Bernd Kuhls wrote:
> While bumping the package from 1.5.4 to 2.2.0 the license hash from
> version 1.6.0 was erroneously used.
> 
> Fixes
> http://autobuild.buildroot.net/results/2d8/2d8344bab5b87d20156814b96cbbab1d5fc89586/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsrtp/libsrtp.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
