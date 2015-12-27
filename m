From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 15:05:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.60.0
In-Reply-To: <20151227145920.28ceac50@free-electrons.com>
References: <1451081406-21991-1-git-send-email-joerg.krause@embedded.rocks>
 <20151227145920.28ceac50@free-electrons.com>
Message-ID: <20151227150531.1072a816@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Dec 2015 14:59:20 +0100, Thomas Petazzoni wrote:

> On Fri, 25 Dec 2015 23:10:06 +0100, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  package/boost/boost.hash | 6 +++---
> >  package/boost/boost.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> This update is causing a large number of build failures (some may not
> be related to the update itself, but some clearly seem to be new). Can
> you have a look at:
> 
>   http://autobuild.buildroot.org/?reason=boost-1.60.0

We are also getting build failures of Boost on the host:

  http://autobuild.buildroot.org/?reason=host-boost-1.60.0

This might be due to the host compiler not having C++11 support.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
