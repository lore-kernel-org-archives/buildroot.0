From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 11:56:09 +0200
Subject: [Buildroot] [PATCH 1/3] board: add Beelink GS1 support
In-Reply-To: <CAJiuCcdXSOBqc5ngfTCg4=uo8YGgWKQwwawm3iEOQWPbj1B7Gg@mail.gmail.com>
References: <20190920190813.21516-1-peron.clem@gmail.com>
 <20190920190813.21516-2-peron.clem@gmail.com>
 <20191026100733.075a89ab@windsurf.home>
 <CAJiuCcdXSOBqc5ngfTCg4=uo8YGgWKQwwawm3iEOQWPbj1B7Gg@mail.gmail.com>
Message-ID: <20191026115609.05639d3c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 10:56:02 +0200
Cl?ment P?ron <peron.clem@gmail.com> wrote:

> Do you think the other patches can be merged too or are they to
> "user-specific" ?

As Arnout said, PATCH 3/3, for the part that enables DHCP on eth0, can
be added using BR2_SYSTEM_DHCP="eth0". This is acceptable upstream.

Customizing the root password is not, as is adding autossh and dropbear.

Adding mdev could be acceptable, for example if it's needed to load
some kernel modules.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
