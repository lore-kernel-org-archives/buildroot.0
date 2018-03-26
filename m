From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 14:38:21 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: enable toolchain install
 staging phase
In-Reply-To: <20180326120043.25160-1-chemobejk@gmail.com>
References: <20180326120043.25160-1-chemobejk@gmail.com>
Message-ID: <20180326143821.41673976@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Mar 2018 15:00:43 +0300, Stefan Becker wrote:
> Really fix commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad
> 
> That commit added a script to "toolchain" post install staging hooks.
> This will only be executed if TOOLCHAIN_INSTALL_STAGING is set to YES.
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Indeed. Thanks for fixing this!

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
