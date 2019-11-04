From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:12:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: drop autoreconf
In-Reply-To: <20191103224050.19941-1-fontaine.fabrice@gmail.com>
References: <20191103224050.19941-1-fontaine.fabrice@gmail.com>
Message-ID: <20191104221258.516a56c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 23:40:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Obviously, autoreconf is not needed since the switch to meson
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 3 ---
>  1 file changed, 3 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
