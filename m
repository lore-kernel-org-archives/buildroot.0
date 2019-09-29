From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:14:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/glmark2: drm support needs udev
In-Reply-To: <20190929062737.24273-1-bernd.kuhls@t-online.de>
References: <20190929062737.24273-1-bernd.kuhls@t-online.de>
Message-ID: <20190929091430.64b1b001@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 08:27:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream commit
> https://github.com/glmark2/glmark2/commit/a7ae55dae4971af97bb71d38419089018c3671de
> added a dependency for udev when the drm flavor is used.
> 
> Fixes:
> http://autobuild.buildroot.net/results/01b/01b7374a5b7e66f2c369c7f93dae68353a3ffe81/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/glmark2/glmark2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
