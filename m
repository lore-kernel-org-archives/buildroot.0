From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jul 2020 09:09:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/minetest: don't depend on luajit
In-Reply-To: <20200727205621.2556101-1-james.hilliard1@gmail.com>
References: <20200727205621.2556101-1-james.hilliard1@gmail.com>
Message-ID: <20200728090907.4f093194@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 14:56:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Since minetest has a fallback to a bundled lua when luajit is not
> available we don't need to depend on luajit or any lua version at all.

In general, I think we try to not use bundled libraries even when they
exist. If minetest needs a Lua interpreter, it should always use an
external Lua interpreter, I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
