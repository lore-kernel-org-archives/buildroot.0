From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 23:56:56 +0100
Subject: [Buildroot] [PATCH] package/collectd: add config option for lua
In-Reply-To: <20200127172740.11610-1-tom.marcuzzi@orolia.com>
References: <20200127172740.11610-1-tom.marcuzzi@orolia.com>
Message-ID: <20200202235656.4e341870@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jan 2020 17:28:15 +0000
Tom Marcuzzi <tom.marcuzzi@orolia.com> wrote:

> Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
> ---
>  package/collectd/Config.in   | 7 +++++++
>  package/collectd/collectd.mk | 9 ++-------
>  2 files changed, 9 insertions(+), 7 deletions(-)

I've applied, after extending the commit log. I discussed this with
Peter Korsgaard, and while we normally prefer automatic dependencies,
collected indeed has lots of sub-options for its different features, so
it kind of made sense to do the same for Lua.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
