From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:10:53 +0200
Subject: [Buildroot] [PATCH v2 33/37] qemu/Config.in.host: fix
 overindented depends on
In-Reply-To: <20180401050850.5701-34-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-34-ricardo.martincoski@gmail.com>
Message-ID: <20180401091053.37d41d90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:46 -0300, Ricardo Martincoski wrote:
> Do the same as used in all other Config.in files and use only one tab.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  package/qemu/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
