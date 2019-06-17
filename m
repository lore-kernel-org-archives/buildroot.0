From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:25:10 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/waylandpp: bump version
In-Reply-To: <20190616201621.23912-3-bernd.kuhls@t-online.de>
References: <20190616201621.23912-1-bernd.kuhls@t-online.de>
 <20190616201621.23912-3-bernd.kuhls@t-online.de>
Message-ID: <20190617202510.34810360@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jun 2019 22:16:21 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream:
> https://github.com/NilsBrause/waylandpp/commit/242c2c9a188b1a972978fc05dbe70d102bc7c4e1
> 
> Bundled pugixml was removed:
> https://github.com/NilsBrause/waylandpp/commit/433ce65b681c27d54e1e6b9a602f1c8291aabd54
> 
> Use host-pugixml instead and bump to HEAD to include a patch which
> fixes a linking error:
> https://github.com/NilsBrause/waylandpp/commit/41063c3e1de245bb7ea0c940e7400bd876bee25e
> 
> Updated license hash due to upstream commit:
> https://github.com/NilsBrause/waylandpp/commit/f255d61ffd982614c0659be1742383dab06710a2
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks, applied to master. Could you ask upstream to cut a new release,
since the recent fixes are quite important ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
