From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 14:09:09 +0200
Subject: [Buildroot] [v4 05/13] pkg-{download,
 generic}: use new $($(PKG)_DL_DIR)
In-Reply-To: <20180402110657.GD3625@scaer>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-5-maxime.hadjinlian@gmail.com>
 <20180402110657.GD3625@scaer>
Message-ID: <20180402140909.090f13ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Apr 2018 13:06:57 +0200, Yann E. MORIN wrote:
> Maxime, All,
> 
> On 2018-04-02 10:14 +0200, Maxime Hadjinlian spake thusly:
> > Let the infrastructure use the new variable $(PKG)_DL_DIR  
> 
> There were a few remaining other instances that needed changing, we've
> done that IRL together.

And also $($(PKG)_DL_DIR) is not "new".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
