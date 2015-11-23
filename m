From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 23 Nov 2015 17:53:47 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-21
In-Reply-To: <20151122105711.185037f6@free-electrons.com>
References: <20151122073011.8CA87102679@stock.ovh.net>
 <20151122105711.185037f6@free-electrons.com>
Message-ID: <20151123165346.GX19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> >        sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/3a0b601a3dd1a538247d11054e3623e6a242d854/
> 
> The usual SPARC issue. I suggest to disable libtirpc on sparc. Waldemar?

The update to 1.0.x would fix it, but this is to late.
Can someone submit a patch to disable it?
I don't have an idea how to handle the reverse dependency stuff
to other packages...

best regards
 Waldemar
