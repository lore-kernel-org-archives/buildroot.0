From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:47:24 +0200
Subject: [Buildroot] [PATCH] package/cegui: disable minizip support
In-Reply-To: <20200407151516.120770-1-b.bilas@grinn-global.com>
References: <20200407151516.120770-1-b.bilas@grinn-global.com>
Message-ID: <20200408214724.2fae4efb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 17:15:16 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Disable support for minizip since cegui is not compatible
> with the existing buildroot's version due to lack of
> necessary header. It will be restored when upstream will
> switch to the new version.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/65fa719e8b2466409a12eb103a8938e1488efc0c
>  - http://autobuild.buildroot.net/results/ef37a0cc16daacb7206d736c86b511c7d90eefe0
> 
> and many more.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/cegui/cegui.mk | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
