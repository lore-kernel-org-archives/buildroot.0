From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 15:19:18 +0200
Subject: [Buildroot] Discussion on per-package logging
In-Reply-To: <20171011130842.GA2659@scaer>
References: <20171011105809.2bf05267@windsurf.lan>
 <20171011130842.GA2659@scaer>
Message-ID: <20171011151918.5c48d933@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 15:08:42 +0200, Yann E. MORIN wrote:

> In my opinion, we can't do and should not do anything about it.
> 
> Either the user wants a fast build, and then it is acceptable that the
> output gets mangled, or he is trying to debug the build and thus is not
> doing parallel build to start with.

I disagree with you, because there will obviously be cases where we
want to debug a parallel build. A parallel build might uncover some
specific issues, and we will want to have a look at the build log of a
given package to understand what happened.

So I disagree on your assumption that either you're debugging or you're
building in parallel.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
