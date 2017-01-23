From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 11:34:51 +1300
Subject: [Buildroot] [PATCH] python-lxml: allow build as host package
In-Reply-To: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
References: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170124113451.2af0d791@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jan 2017 11:51:16 -0200, Carlos Santos wrote:
> While currently there is no in-tree Buildroot package which depends on
> host-python-lxml, we (DATACOM) have some proprietary modules that use it
> in their test scripts.
> 
> We tested python-lxml as host package and confirmed that it builds and
> works correctly. Someone else might require it, so we are proposing its
> inclusion.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

I remain a little bit uncomfortable with host packages that have no
in-tree user, as it means the code is dead and never tested by our
autobuilder infrastructure.

That being said, lots of aspects of Buildroot are already not tested by
our autobuilder infra, so maybe my argument is not so good after all.

Peter, what is your feeling on this ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
