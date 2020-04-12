From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 11:57:08 +0200
Subject: [Buildroot] [pkg-luarocks v2 2/5] pkg-luarocks: refactor infra
In-Reply-To: <20200322080706.19806-2-francois.perrad@gadz.org>
References: <20200322080706.19806-1-francois.perrad@gadz.org>
 <20200322080706.19806-2-francois.perrad@gadz.org>
Message-ID: <20200412115708.4af92356@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 09:07:03 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> move stuff from luarocks.mk and luarocks-br-config.lua
> to pkg-luarocks.mk
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/luarocks-br-config.lua |  8 --------
>  package/luarocks/luarocks.mk            | 11 -----------
>  package/pkg-luarocks.mk                 | 20 +++++++++++++++++---
>  3 files changed, 17 insertions(+), 22 deletions(-)

I have applied, but after extending the commit log to give more details
about what is happening:

  https://git.buildroot.org/buildroot/commit/?id=052629291449147ff18dc6ff63a94f043ea4aadf

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
