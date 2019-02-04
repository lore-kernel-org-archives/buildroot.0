From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 17:33:33 +0100
Subject: [Buildroot] [PATCH 1/3] arch/mips: introduce mips32r3 and
 mips64r3
In-Reply-To: <20190130201224.6555-1-patrickdepinguin@gmail.com>
References: <20190130201224.6555-1-patrickdepinguin@gmail.com>
Message-ID: <20190204173333.18c9069e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Jan 2019 21:12:22 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> It's unclear why Buildroot only defined MIPS 32/64 releases 1, 2, 5 and 6
> while 3 exists as well.
> 
> Interesting fact:
> "Release 4 was skipped because the number four is perceived as unlucky in
> many Asian cultures."
> https://en.wikipedia.org/wiki/MIPS_architecture#MIPS32/MIPS64
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  arch/Config.in.mips | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

Patch series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
