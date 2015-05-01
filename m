From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 11:34:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.58.0
In-Reply-To: <20150501101802.23313dd0@free-electrons.com>
References: <1430393361-27646-1-git-send-email-joerg.krause@embedded.rocks>
 <20150501101802.23313dd0@free-electrons.com>
Message-ID: <20150501113421.339aab74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 May 2015 10:18:02 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu, 30 Apr 2015 13:29:21 +0200, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  package/boost/boost.hash | 6 +++---
> >  package/boost/boost.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> Applied, thanks.

In fact, no, I've reverted this patch. It breaks the build badly, with
issues such as
http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/build-end.log
(i.e trying to pass -m32 on MIPS doesn't make any sense).

Can you look into those issues, and test at least the build on ARM,
MIPS and x86 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
