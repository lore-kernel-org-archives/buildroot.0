From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 19 May 2016 22:17:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-18
In-Reply-To: <1463686416.2081.20.camel@embedded.rocks>
References: <20160519063019.BA798101875@stock.ovh.net>
 <1463686416.2081.20.camel@embedded.rocks>
Message-ID: <1463689052.2081.22.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2016-05-19 at 21:33 +0200, J?rg Krause wrote:
> On Do, 2016-05-19 at 08:30 +0200, Thomas Petazzoni wrote:
> > Build statistics for 2016-05-18
> > ===============================
> > 
> > ??????x86_64 |??????????????????????lxc-1.1.5 | NOK |
> > http://autobuild.buildroot.net/results/f321823be6b477be7dc55393e563
> > a3
> > a61794265d/
> 
> musl build issues...
> 
> Upstreams version 2.0.x includes a series of 7 patches to allow
> building lxc with the musl libc. I would prefer to update rather than
> backport all the necessary patches. However, we're already in the
> release candidate cycle.

In fact, those patches are not needed for our configuration of lxc.
However, another patch is required which is not yet available on
upstream. I will submit a patch soon.

Best regards
J?rg Krause
