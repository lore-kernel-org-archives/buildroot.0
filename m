From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Dec 2013 08:48:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-23
In-Reply-To: <201312240841.14750.yann.morin.1998@free.fr>
References: <20131224073009.58151100F70@stock.ovh.net>
 <201312240841.14750.yann.morin.1998@free.fr>
Message-ID: <20131224084800.210148d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 24 Dec 2013 08:41:14 +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On Tuesday 24 December 2013 08:30:08 Thomas Petazzoni wrote:
> >    powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/c6ed5a9d0732263d3fdd464770a6bf602602c169/
> >     mipsel | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/14d8468d4e547b0975c4abbd7458325a1c4d24e3/
> >    aarch64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/1baade69413055a4df80a511352f70903e1b033f/
> >       mips | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/2dcd3dea32e1c761d7f2ade17bc085b33316a4e5/
> >     x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/3e0c346a1cda21f8e866632cc282f05680129f84/
> >   mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/86b4faa0cf1a8f0a3f6dfc2fb816432c876988ef/
> 
> Those five should be fixed with either Thomas' patch or mine.

Yes, Peter please apply Yann's patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
