From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:58:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/flare-game: new package
In-Reply-To: <20180319211903.11539-2-romain.naour@gmail.com>
References: <20180319211903.11539-1-romain.naour@gmail.com>
 <20180319211903.11539-2-romain.naour@gmail.com>
Message-ID: <20180409215829.732e1b3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Mar 2018 22:19:03 +0100, Romain Naour wrote:

> +	  flare-game is a package that requires flare-engine that only
> +	  contains this game data.

The double "that" here wasn't very clear, so I've reworded this to:

+         This package, flare-game, only contains the game data. The
+         game engine itself is part of a separate package,
+         flame-engine.

> +FLARE_GAME_DEPENDENCIES += flare-engine

Dropped the += to be just = here.

> +# Don't use /usr/share/games
> +FLARE_GAME_CONF_OPTS += -DDATADIR=share/flare

I should have done the same here, but I haven't. Not a big deal.

Applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
