From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 14:43:40 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-08
In-Reply-To: <480602992.4326585.1499689836292.JavaMail.zimbra@datacom.ind.br>
References: <20170709063052.6F78221DB3@mail.free-electrons.com>
 <480602992.4326585.1499689836292.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170710144340.4fab6bd4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 09:30:36 -0300 (BRT), Carlos Santos wrote:
> > From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Sent: Sunday, July 9, 2017 3:30:52 AM
> > Subject: [autobuild.buildroot.net] Your build results for 2017-07-08  
> 
> > Hello,
> > 
> > This is the list of Buildroot build failures that occured on
> > 2017-07-08, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> > 
> > Build failures related to your packages:
> > 
> >    mips64el |           host-util-linux-2.30 |
> >    http://autobuild.buildroot.net/results/a0096eb6e65b83b2b0c7d38e5f978c3fe636cb30  
> 
> Segfault in /bin/bash. Does not seem to be related to the package.

This is happening on Peter's autobuilder instance. It failed twice:
http://autobuild.buildroot.net/?reason=host-util-linux-2.30. One time
due to an Illegal instruction, second time due to a Segmentation fault.

Peter ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
