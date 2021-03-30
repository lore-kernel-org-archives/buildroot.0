From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:23:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/sdl2: drop tslib
In-Reply-To: <20210321162128.192269-1-fontaine.fabrice@gmail.com>
References: <20210321162128.192269-1-fontaine.fabrice@gmail.com>
Message-ID: <20210330222344.065c40a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Mar 2021 17:21:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> non existing tslib support has been dropped since version 2.0.14 and
> https://github.com/libsdl-org/SDL/commit/4c96faee578efcba3f2d6afe8e2122f26b1dfb0b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sdl2/sdl2.mk | 7 -------
>  1 file changed, 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
