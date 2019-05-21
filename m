From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 May 2019 10:02:37 +0200
Subject: [Buildroot] [PATCH] package/atop: fix BUG_85180 build timeout
In-Reply-To: <757973bf-7d43-f3d6-8364-b4353d42b317@mind.be>
References: <20190520212723.63754-1-giulio.benetti@micronovasrl.com>
 <20190521091551.384da8a1@windsurf.home>
 <757973bf-7d43-f3d6-8364-b4353d42b317@mind.be>
Message-ID: <20190521100237.18d46daa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 May 2019 09:55:16 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I think it's just that in *this* case, it is also solved by using -g1 instead
> of -g2, which is less "aggressive" than passing -O0. However, I agree with
> Thomas that it's better to use the same solution everywhere, even if it is
> suboptimal.

I agree: using the same solution everywhere is better, even if slightly
suboptimal here or there.

>  Just to be sure: in some cases, -Os also works, but not in all cases, right?
> Otherwise I'd actually prefer -Os instead of -O0.

Agreed as well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
