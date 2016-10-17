From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2016 14:17:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-10-16
In-Reply-To: <1119811525.1122795.1476702040533.JavaMail.zimbra@datacom.ind.br>
References: <20161017063033.11712102EE9@stock.ovh.net>
 <1119811525.1122795.1476702040533.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20161017141751.0a92a2e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 09:00:40 -0200 (BRST), Carlos Santos wrote:
> > From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> > To: buildroot at buildroot.org
> > Sent: Monday, October 17, 2016 4:30:33 AM
> > Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-16  
> [...]
> >             util-linux-2.28.2 | 1  
> [...]
> >      x86_64 |              util-linux-2.28.2 | NOK |
> >      http://autobuild.buildroot.net/results/be2e81b27a21355d7a453316d9df1cd4b0da2106  
> 
> I'm investigating this error.

It needs a select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS + depends on
BR2_USE_MMU.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
