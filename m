From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 21:17:56 +0100
Subject: [Buildroot] [git commit] package/tcl: move comment around,
 to keep proper indentation
In-Reply-To: <877fjv21n1.fsf@dell.be.48ers.dk>
References: <20151228165835.08B517F8EB@busybox.osuosl.org>
 <877fjv21n1.fsf@dell.be.48ers.dk>
Message-ID: <20151230211756.4023d5e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 30 Dec 2015 20:10:42 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> > commit: http://git.buildroot.net/buildroot/commit/?id=ac371770de69b5ee5f15eed7dd790558b8835d7d
> > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> > In Kconfig, when there is an item (like a comment) between a symbol and
> > its dependees, then the indentation is not in effect.
> 
> > Move the symbol to the top of the file to guarantee the indentation in
> > menuconfig.
> 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Thomas, it seems like you forgot to use the -s option to git am, please
> try to remember.

Hum, right. But in fact it is due to the fact that I did not "git am"
such patches. Yann sent them to the list, then immediately marked them
as RFC in Patchwork, so that they were no longer visible in the list of
pending patches in Patchwork.

So, rather than fetching them with patchwork, I simply "git
cherry-pick"ed them from Yann's Git repo. So the process to get those
patches was not the classical one, hence I forgot to add my SoB line.

Otherwise, I use my "git pwam" alias, which automatically adds my SoB
line, so I can't forget it.

That being said, this is not an excuse, so sorry for the mess. But it
explains why those 6 patches didn't have my SoB line.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
