From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Apr 2017 14:20:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-25
In-Reply-To: <1101594360.20478325.1493204871665.JavaMail.zimbra@datacom.ind.br>
References: <20170426062839.7446620CA4@mail.free-electrons.com>
 <1101594360.20478325.1493204871665.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170426142020.41d27312@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 08:07:51 -0300 (BRT), Carlos Santos wrote:
> > From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> > To: buildroot at buildroot.org
> > Sent: Wednesday, April 26, 2017 3:28:39 AM
> > Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-25  
> ---8<---
> > Build statistics for 2017-04-25
> > ================================
> >         arc |              util-linux-2.29.2 | NOK |
> >         http://autobuild.buildroot.net/results/9bf1c9e84cab64bccc3c86a8a2899cd71b8f91d4  
> ---8<---
> 
> Regression caused by commit 5f8ef7e25c5cc5c2e4ae4c8b6e8caa029ddf9a94.
> 
> Should we revert it?

Let's wait a bit for Vlad's input on this, Synopsys is usually quite
reactive in providing fixes for toolchain issues on ARC.

Vlad?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
