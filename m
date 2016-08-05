From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:17:42 +0200
Subject: [Buildroot] [PATCH] binutils: fix bfin problem
In-Reply-To: <20160731082620.GA28355@waldemar-brodkorb.de>
References: <20160731082620.GA28355@waldemar-brodkorb.de>
Message-ID: <20160805211742.2ec2426c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 10:26:20 +0200, Waldemar Brodkorb wrote:
> Fix for LINKER BUG: .rofixup section size mismatch problems.
> 
> Bug was already reported by Stuart Henderson to binutils upstream:
> https://sourceware.org/bugzilla/show_bug.cgi?id=13391

The bug dates back from 2011, and nobody cared. Does this mean that we
will have to carry this "temporary workaround" forever in Buildroot?

I've applied your patch, but I must say I'm not too happy to see this
kind of things being added :-/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
