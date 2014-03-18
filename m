From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 05:54:45 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <CAAEAJfC-R-ieqWuNFaeD3BeYoeM1WogQVwpQVUyfLw9xtLv2iA@mail.gmail.com>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
 <20140316160712.GA3267@free.fr>
 <CAAEAJfC-R-ieqWuNFaeD3BeYoeM1WogQVwpQVUyfLw9xtLv2iA@mail.gmail.com>
Message-ID: <20140318055445.2aa965bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Sun, 16 Mar 2014 20:51:53 -0300, Ezequiel Garc?a wrote:

> Quick context for directfb-lua.
> 
> This is a little languange binding I created a few years ago when I was working
> close to DirectFB. However, it's no longer the case, and I won't be
> improving it.
> Of course, I'm still here and I can try to maintain it.
> 
> Probably it should be integrated into DirectFB itself, as a automated-test tool
> or something, but that's something the DFB people should do.
> 
> I thought about submitting the package to Buildroot, as otherwise it would fall
> into oblivion. The tool itself is handy for anyone working on DFB; at
> least to run
> quick API tests.
> 
> That said, I'm happy to provide a v2, addressing Fran?ois' feedback.
> I just need to find some time to do it.

If you don't use it, you don't really develop it anymore, and there
isn't interest from other users, then maybe it isn't worth the effort
to add this package in Buildroot?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
