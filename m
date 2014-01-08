From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 8 Jan 2014 10:56:50 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel
	make
In-Reply-To: <52B32DF1.2010702@mind.be>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <52B32DF1.2010702@mind.be>
Message-ID: <CAHkwnC8S0Cno0L5rokUF4o9pDfuDompzShJ1WBoZ=QjR-d5CgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 19, 2013 at 6:33 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/12/13 11:36, Fabio Porcedda wrote:
<snip>
>> On my quad core system the building time for qemu_x86_defconfig
>> is 14m versus 11m and with ccache enabled 7m vs 5m.
>
>
>  These are not very relevant benchmarks because there's not a lot that can
> be done in parallel there. It would be much more interesting with an
> allpackageyesconfig (which you'll have to modify by hand BTW to exclude some
> packages that don't build...).

I've build  the first 220 packages of the "allpackageyesconfig", now
the numbers look better: 43m vs 18m.

Best regards
-- 
Fabio Porcedda
