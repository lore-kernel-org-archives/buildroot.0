From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 13:52:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-04
In-Reply-To: <52F22534.6030403@imgtec.com>
References: <20140205073010.8762B101A86@stock.ovh.net>
 <52F22534.6030403@imgtec.com>
Message-ID: <20140205135206.58a30106@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 5 Feb 2014 11:49:08 +0000, Vicente Olivert Riera wrote:
> On 02/05/2014 07:30 AM, Thomas Petazzoni wrote:
> > Classification of failures by reason
> > ====================================
> >                    bcusdk-0.0.5 | 1
> 
> > Detail of failures
> > ===================
> >      mipsel |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/32ad17192194171a4b9b5334731d32a323e2b007/
> 
> This failure is *not* present when using the internal BR toolchain. 
> Perhaps the "br-mipsel-o32-full-2013.11-rc2.tar.bz2" toolchain should be 
> upgraded.

Seems to be related to the internal toolchain bug which lead
libstdc++.a to not be generated. I am waiting for Peter to release
2014.02-rc1, and I will rebuild all the Buildroot external toolchains
to this release, which will fix this problem.

Thanks for your investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
