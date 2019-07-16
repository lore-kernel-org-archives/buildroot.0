From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 16 Jul 2019 17:52:51 +0000
Subject: [Buildroot] [PATCH 0/2 v2] arch: allow passing compile flags
 (branch yem/arc-atomic)
In-Reply-To: <cover.1563114574.git.yann.morin.1998@free.fr>
References: <cover.1563114574.git.yann.morin.1998@free.fr>
Message-ID: <CY4PR1201MB01203F114D92BD4E89EB806CA1CE0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E. MORIN
> Sent: Sunday, July 14, 2019 5:30 PM
> To: buildroot at buildroot.org
> Cc: Alexey Brodkin <abrodkin@synopsys.com>; Alexey Brodkin <abrodkin@synopsys.com>; Arnout
> Vandecappelle <arnout@mind.be>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Yann E . MORIN
> <yann.morin.1998@free.fr>
> Subject: [PATCH 0/2 v2] arch: allow passing compile flags (branch yem/arc-atomic)
> 
> Hello All!
> 
> This series makes it so that architectures can set compilation flags,
> passed down via the wrapper.

Works like a charm now for building Linux perf for ARC770 (finally)!
Thanks for doing that!

That said for entire series...

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
