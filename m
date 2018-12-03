From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:28:08 +0100
Subject: [Buildroot] [PATCH v3 1/1] lua: remove 5.2.x version
In-Reply-To: <20181202102506.24699-1-francois.perrad@gadz.org>
References: <20181202102506.24699-1-francois.perrad@gadz.org>
Message-ID: <20181203222808.6dbfdecd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sun,  2 Dec 2018 11:25:06 +0100, Francois Perrad wrote:
> At this time :
> - Lua 5.3.5 will be the last one of its serie.
> - Lua 5.4 is up coming (lua-5.4.0-work2 is already available).
> - Lua 5.2.4 was released on 2015.
> For various reasons in the Lua ecosystem, the Lua 5.1 will stay.
> On BR, Lua 5.3 is the default version since 2016.02.
> 
> So, the serie which could be removed is the 5.2.x.
> We could wait some days for other user feedback.
> 
> Note: see discussion when 5.3.x was introduced : http://lists.busybox.net/pipermail/buildroot/2015-January/117638.html

One quick question: Prosody 0.11 has been released, and they say:

"""
Prosody has traditionally used Lua 5.1. As we announced back when 0.10
was released, we are on the path to updating to more recent Lua
versions.

The recommended Lua version for 0.11 is Lua 5.2, while Lua 5.1 is still
supported for the platforms that need it. 
"""

Should we keep Lua 5.2 for Prosody ?

> v2 --> v3
>   - rebase on top of BR 2018.11

The changelog should go...

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---

... here. Otherwise, it becomes part of the commit log when applying,
which we don't want.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
