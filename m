From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:24:02 +0200
Subject: [Buildroot] [PATCH 0/5] legacy: drop old options (branch
 yem/drop-old-legacy)
In-Reply-To: <cover.1616878389.git.yann.morin.1998@free.fr>
References: <cover.1616878389.git.yann.morin.1998@free.fr>
Message-ID: <20210328212402.696e0207@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Mar 2021 21:53:28 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We advertise that legacy symbols will be removed after two years.
> However, so far, we've be more lax than that, and we only dropped
> symbols after about 5 year have elapsed.
> 
> This series removes options in step, starting with the usual 5-year
> threshold, in 1-year increments, to eventually catch-up with the
> advertised 2-year threshold.
> 
> Additionally, a little shell snippet is added in the comments, to
> help eventually drop those legacy symbols when they are still used
> elsewhere (e.g. as legacy defaults).

In fact, I am not sure I agree with the rule that we should keep them
only 2 years. Indeed, for users that follow the LTS releases, 2 years
should be more than enough. But believe it or not, our 12 months
maintenance period is still considered too short by users who don't
always have the resources/skills to update once a year. So we still do
have users that upgrade quite infrequently.

Since the maintenance cost of those legacy options is essentially zero,
I am wondering if we really need to drop them. Should we change the
rule and drop the ones that are 5 years old for example ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
