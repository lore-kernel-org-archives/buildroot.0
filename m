From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:35:02 +0200
Subject: [Buildroot] [PATCH v2 1/3] shadowsocks-libev: Drop the useless
 hash.
In-Reply-To: <20180611181823.2722-1-xuminready@gmail.com>
References: <20180611181823.2722-1-xuminready@gmail.com>
Message-ID: <20180617153502.295dea02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jun 2018 11:18:21 -0700, Min Xu wrote:
> Signed-off-by: Min Xu <xuminready@gmail.com>
> ---
>  package/shadowsocks-libev/shadowsocks-libev.hash | 1 -
>  1 file changed, 1 deletion(-)

I've applied, but there are a few minor things that could have been
done better (yes, even for such a simple patch):

 1. Use a small letter to start the commit title, i.e:

    shadowsocks-libev: drop the useless patch

 2. Remove the final dot in the commit title

 3. Add a commit log that explains *why* you're doing this change. I've
    added the following commit log:

    In commit f8d44394777fb9b45befaee3333d974dfe5e745d
    ("shadowsocks-libev: new package"), when this package was
    introduced, the hash for a license file that isn't available in
    upstream's tarball was added to the license file. Obviously, this
    hash serves no purpose, so drop it.
    
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
