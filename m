From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 16:36:05 +0100
Subject: [Buildroot] [PATCH] tmux: bump to version 2.8
In-Reply-To: <bd48f5e4578d612e0c32d92c132d58f5078d7a54.1545909044.git.baruch@tkos.co.il>
References: <bd48f5e4578d612e0c32d92c132d58f5078d7a54.1545909044.git.baruch@tkos.co.il>
Message-ID: <20181227163605.7eb7cf2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 13:10:44 +0200, Baruch Siach wrote:
> Remove README from license files. The Buildroot generated image does not
> use the source files that README mentioned. README states that other
> files "have a license and copyright notice at their start", which
> doesn't add much information.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/tmux/tmux.hash | 3 +--
>  package/tmux/tmux.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
