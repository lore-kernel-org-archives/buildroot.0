From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:40:44 +0200
Subject: [Buildroot] [PATCH 1/3] package/lttng-libust: bump version to
 2.11.0
In-Reply-To: <CAB4xu_1Q_twuoii+ssnLTk1ZnfPOYiCNRS202RrvCPFcwoLvQw@mail.gmail.com>
References: <20191022144805.591535-1-eeppeliteloop@gmail.com>
 <20191022215905.6eb2f5f4@windsurf>
 <CAB4xu_1Q_twuoii+ssnLTk1ZnfPOYiCNRS202RrvCPFcwoLvQw@mail.gmail.com>
Message-ID: <20191022224044.20bf28cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 16:20:36 -0400
Philippe Proulx <eeppeliteloop@gmail.com> wrote:

> > I've applied after fixing this. Thanks!  
> 
> Ok thanks.
> 
> `--enable-numa` is the default which is why I didn't write it
> explicitly, but it looks safer your way.

Right, but you also didn't add numactl to LTTNG_LIBUST_DEPENDENCIES, so
there was nothing that would guarantee it to be built before
liblttng-libust.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
