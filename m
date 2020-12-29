From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 21:10:47 +0100
Subject: [Buildroot] [PATCH] package/connman: improve SysV init script
In-Reply-To: <20201221182858.66326-1-m.niestroj@grinn-global.com>
References: <20201221182858.66326-1-m.niestroj@grinn-global.com>
Message-ID: <20201229211047.3dd7a41b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Dec 2020 19:28:58 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Use a more generic template for SysV init script, similar to packages
> like syslog-ng. This includes adding support for both reload and
> restart. Add support for sourcing /etc/default/connmand file, so that
> new commandline arguments can be added more easily.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/connman/S45connman | 64 ++++++++++++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
