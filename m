From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 15:12:02 +0200
Subject: [Buildroot] [PATCH] bandwidthd: fix static build
In-Reply-To: <54314137.7020007@gmail.com>
References: <7d38491011008b60f8ad91ec0261af046d453685.1412232567.git.baruch@tkos.co.il>
 <542CFECE.9020103@gmail.com>
 <20141002075203.GG3006@sapphire.tkos.co.il>
 <542D0518.3050704@gmail.com>
 <20141002075844.GH3006@sapphire.tkos.co.il>
 <542D0BC9.4060905@gmail.com>
 <20141002083349.GI3006@sapphire.tkos.co.il>
 <542E43A7.6080003@gmail.com>
 <20141005045037.GA2567@sapphire.tkos.co.il>
 <20141005144043.7b3aaac0@free-electrons.com>
 <54314137.7020007@gmail.com>
Message-ID: <20141005151202.7c149f6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Sun, 05 Oct 2014 21:01:43 +0800, Nathaniel Roach wrote:

> Yeah, I'm starting to lean that way too. Although I was a little
> hesitant adding another build dependency, I now realise that it's
> probably getting built anyway, and the version that's currently up on
> github was more a case of "getting it to work".

pkg-config is already needed by a *lot* of packages. And it's very
quick to build (simple C code with no dependencies).

> I've had a look at pcap-config and it doesn't seem to do -lpthreads (or
> from what I could see anything useful in this case), so I'll likely
> adapt Baruch's original patch into upstream for both lpcap and lpng.
> 
> It might take me a few days as my study load has increased, but I'll get
> it done.

Cool, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
