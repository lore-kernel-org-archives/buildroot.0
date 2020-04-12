From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:59:19 +0200
Subject: [Buildroot] [pkg-luarocks v2 4/5] package/lua: allows to load
 native modules from host-lua
In-Reply-To: <20200322080706.19806-4-francois.perrad@gadz.org>
References: <20200322080706.19806-1-francois.perrad@gadz.org>
 <20200322080706.19806-4-francois.perrad@gadz.org>
Message-ID: <20200412145919.52b9d422@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 09:07:05 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> so, we need a liblua.so
> and some modules require Lua 5.2 functions
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/lua.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master with an improved commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
