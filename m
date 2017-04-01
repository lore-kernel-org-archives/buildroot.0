From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:40:51 +0200
Subject: [Buildroot] [PATCH] lpppd: new package
In-Reply-To: <20170102223824.28266-1-Stefan.Nickl@gmail.com>
References: <20170102223824.28266-1-Stefan.Nickl@gmail.com>
Message-ID: <20170401184051.7f6c1252@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Mon,  2 Jan 2017 23:38:24 +0100, stefan.nickl at gmail.com wrote:
> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> After the official github repository for PPP has not seen
> any activity for a long time, I've created a fork that
> tries to do some modernization and shed some legacy.
> For more info, please see https://github.com/snickl/lpppd
> 
> It is inteded as a drop-in replacement for the original PPP,
> therefore I've marked it as conflicting with the existing pppd
> package.
> 
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

I do appreciate your interest in making the pppd development active
again. However, at this point, I don't see what is the benefit of using
lpppd over pppd, and having two separate packages is a bit annoying.
Therefore, I would prefer to wait for lpppd to gain some traction
before packaging it in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
