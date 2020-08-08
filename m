From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:48:55 +0200
Subject: [Buildroot] [PATCH] package/prosody: fix dependency
In-Reply-To: <20200728062141.2969363-1-francois.perrad@gadz.org>
References: <20200728062141.2969363-1-francois.perrad@gadz.org>
Message-ID: <20200808234855.4860dcfa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jul 2020 08:21:40 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> LuaBitOp is not available with Lua 5.3
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/prosody/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an improved commit log. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
