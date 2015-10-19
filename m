From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 19 Oct 2015 22:48:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-15
In-Reply-To: <20151018045734.GA20889@tarshish>
References: <20151016063019.E3466101619@stock.ovh.net>
 <1445129293.7271.17.camel@embedded.rocks> <20151018045734.GA20889@tarshish>
Message-ID: <1445287732.1907.18.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On So, 2015-10-18 at 07:57 +0300, Baruch Siach wrote:
> Hi J?rg,
> 
> That was also my best guess after investigation this issue for some
> time. I 
> think you should raise this issue with upstream to see whether this
> solution 
> is acceptable.

Many thanks for your investigation!

I did so and the patch was accepted upstream [1]. Buildroot patches are
proposed...

[1]?https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db1
2c198fdca752e32

Best regards
J?rg Krause
