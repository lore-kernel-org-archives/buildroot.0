From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:30:31 +0200
Subject: [Buildroot] [PATCH v3 00/10]  Lua 5.4
In-Reply-To: <20200728132147.3155274-1-francois.perrad@gadz.org>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
Message-ID: <20200808183031.30b37fe6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jul 2020 15:21:37 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Francois Perrad (10):
>   package/luabitop: depends on lua 5.1
>   package/lua-compat53: depends on lua ABI 5.1
>   lua: add 5.4.0 version
>   package/lua-messagepack: add support of Lua 5.4
>   package/easybus: temporarily disabled with Lua 5.4
>   package/lua-cqueues: temporarily disabled with Lua 5.4
>   package/lua-flu: temporarily disabled with Lua 5.4
>   package/lua-sdl2: temporarily disabled with Lua 5.4
>   package/luv: temporarily disabled with Lua 5.4
>   package/prosody: temporarily disabled with Lua 5.4

Thanks, series applied to next!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
