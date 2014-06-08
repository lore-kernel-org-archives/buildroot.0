From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Jun 2014 16:09:00 +0200
Subject: [Buildroot] [PATCH 1 of 7 v3] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <20140606212147.GE3481@free.fr>
References: <patchbomb.1402085576@localhost>
 <b1861ead49778767b075.1402085577@localhost>
 <20140606212147.GE3481@free.fr>
Message-ID: <CAAXf6LUOWydda_Fm3Ef_NZaQhHNR=RREGBVAQ5PT16FAYz3qiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Jun 6, 2014 at 11:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2014-06-06 22:12 +0200, Thomas De Schampheleire spake thusly:
>> This patch introduces consistent usage of double-dollar signs throughout the
>> different inner-xxx-targets blocks.
> [--SNIP--]
>> Insight-provided-by: Arnout Vandecappelle <arnout@mind.be>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks!

>
> I tested to build the manual: looks very similar to the original one, I
> did not spot any discrepancy.

I should have mentioned this in the commit message: I compared the
output of the manual (txt+html) and the legal info output (of one
particular config) before and after with success.

>
> I tested my lots-of-packages config to build XBMC on the RPi: the
> graph-depends is the exact same (same sha1, even!).
>
> I grepped the source to see if there was any remaining single-dollar
> signs that should have been covnerted, and for double-dollar signs: I
> could not spot any missing or abusive conversion.

Thanks for these tests and review!
Thomas
