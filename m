From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 22:20:38 +0200
Subject: [Buildroot] [RFC v3 4/4] libinput: bump version to 1.11.0 and
 convert to meson build
In-Reply-To: <20180719204355.10465-4-ps.report@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-4-ps.report@gmx.net>
Message-ID: <20190407222038.2db5708d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 19 Jul 2018 22:43:55 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> For details since 1.8.x see [1], [2] and [3].
> 
> Build system changed from autotools to meson exclusively
> since 1.9.0 (see [1]).
> 
> Add hash for license file.
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2017-October/035469.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2018-February/036957.html
> [3] https://lists.freedesktop.org/archives/wayland-devel/2018-June/038349.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Sorry for the slow answer. Turns out that in the mean time, another
libinput bump was merged which converted the package to use the meson
build system.

So I marked your patch as Superseded in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
