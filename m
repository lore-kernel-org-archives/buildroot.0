From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:26:31 +0200
Subject: [Buildroot] [PATCH 01/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: rename variable 'm'
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190925222631.5fc62fea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Sep 2019 23:13:24 +0200
Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com> wrote:

> Rename variable 'm' for better readability.
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  utils/checkpackagelib/lib_config.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

I have applied patches 1 to 5 (included), with Ricardo Acked-by, after
fixing PATCH 02/18 to initialize self.level, and also taking into
account the other comments made by Ricardo on the commit titles and
commit logs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
