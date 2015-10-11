From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 10:13:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-10
In-Reply-To: <20151011100117.4e8c1b4c@x230.trabucayre.com>
References: <20151011063018.DD233101FF1@stock.ovh.net>
 <20151011100117.4e8c1b4c@x230.trabucayre.com>
Message-ID: <20151011101355.71a5ae61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael,

On Sun, 11 Oct 2015 10:01:17 +0200, gwenhael.goavec wrote:

> On Sun, 11 Oct 2015 08:30:18 +0200 (CEST)
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > x86_64 |                   libftdi-0.20 | NOK |
> > http://autobuild.buildroot.net/results/e6360386a0a99900b83494924494ec40552d8dbe/
> Fixed by
> https://github.com/libusb/libusb-compat-0.1/commit/2e9b6bbebb7cf1ef0095516ec6d5203deb3822e8
> 
> but only available on v0.1.6-rc1 ...

We can temporarily backport the patch to fix this issue.

Thanks for the investigation,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
