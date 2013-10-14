From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 11:27:41 +0200
Subject: [Buildroot] [PATCH] Compile static versions of gcc libraries
In-Reply-To: <2096076.neUu8LQVqN@sagittae>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
 <20131013153355.3839117b@skate> <2096076.neUu8LQVqN@sagittae>
Message-ID: <20131014112741.279b7c49@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Mon, 14 Oct 2013 11:16:08 +0200, J?r?me Pouiller wrote:
> On Sunday 13 October 2013 15:33:55 Thomas Petazzoni wrote:
> > Dear J?r?me Pouiller,
> > 
> > On Thu, 10 Oct 2013 11:40:42 +0200, J?r?me Pouiller wrote:
> > > Since default configure options for host packages include
> > > --disable-static, gcc was not configured to build static version of
> > > its libraries (libgcc.a, libstdc++.a, ...).
> > 
> > I'm a bit confused, the toolchains I have here definitely do have
> > libgcc.a :
> > 
> > $ find . -name 'libgcc.a'
> > ./host/usr/lib/gcc/sh4-buildroot-linux-uclibc/4.7.3/libgcc.a
> 
> Sorry, in contrary of what I wrote in my commit message, this does not 
> impact libgcc.a. However, it impacts libstdc++.a, libgomp.a, 
> libmudflap*.a, ...
> 
> > What practical issue are you seeing?
> My main concern is libstdc++.a.

Ah, ok. I'll retry then and see what happens :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
