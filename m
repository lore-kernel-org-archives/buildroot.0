From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 10:03:04 +0100
Subject: [Buildroot] [PATCH] glmark2: bump version
In-Reply-To: <CAAMH-yvBA9gpFLNy1Tu+x4A2fFOetdGHgVeLkpnAweBqsUS8iQ@mail.gmail.com>
References: <20170213200619.10535-1-gary.bisson@boundarydevices.com>
 <20170213223900.7167f053@free-electrons.com>
 <CAAMH-yt5ar=Y3zRR-Y3XRMSD-nWXGSfOLbY7WMj_+ZUR1+Eb+w@mail.gmail.com>
 <20170214094436.224c3db8@free-electrons.com>
 <CAAMH-yvBA9gpFLNy1Tu+x4A2fFOetdGHgVeLkpnAweBqsUS8iQ@mail.gmail.com>
Message-ID: <20170214100304.4970a39f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 09:49:09 +0100, Gary Bisson wrote:

> No that is what I meant, "injecting" a defconfig so that a problem
> that we see locally can be reproduced by a server and that we know
> there will be a trace of that issue somewhere (with all the proper
> information).
> 
> I understand it would be a mess to maintain such infrastructure, but
> at least that would be a go-to response when someone says something is
> broken: put your defconfig on the server and we'll see.

Well, in practice this is not really useful. If a given problem has
been produced by the autobuilders, it's really easy to find it. For
example, for your glmark2 issue, I simply did:

  http://autobuild.buildroot.net/?reason=glmark2-fa71af2dfab711fac87b9504b6fc9862f44bf72a

And looked at the last few errors, and they were the ones your patch
was fixing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
