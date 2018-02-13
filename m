From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 08:49:30 +0100
Subject: [Buildroot] [PATCH 08/14] diffconfig: fix code style
In-Reply-To: <5a825820cac23_51963fbb9c9c7128471b1@ultri3.mail>
References: <20180130202512.GA7723@gmail.com>
 <5a825820cac23_51963fbb9c9c7128471b1@ultri3.mail>
Message-ID: <20180213084930.07104f73@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Feb 2018 01:14:40 -0200, Ricardo Martincoski wrote:

> Adding this line to .flake8
> exclude=utils/diffconfig
> 
> It looks to me the later is preferable. This way a script that don't need any
> tweak can be a raw copy from the original.

Agreed, the latter seems preferable to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
