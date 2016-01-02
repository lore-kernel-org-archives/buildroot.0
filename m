From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 02 Jan 2016 12:20:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.60.0
In-Reply-To: <20151227145920.28ceac50@free-electrons.com>
References: <1451081406-21991-1-git-send-email-joerg.krause@embedded.rocks>
 <20151227145920.28ceac50@free-electrons.com>
Message-ID: <1451733604.1929.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On So, 2015-12-27 at 14:59 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Fri, 25 Dec 2015 23:10:06 +0100, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > ?package/boost/boost.hash | 6 +++---
> > ?package/boost/boost.mk???| 2 +-
> > ?2 files changed, 4 insertions(+), 4 deletions(-)
> 
> This update is causing a large number of build failures (some may not
> be related to the update itself, but some clearly seem to be new).
> Can
> you have a look at:
> 
> ? http://autobuild.buildroot.org/?reason=boost-1.60.0

The libquadmath issue should be fixed by [1]. For the FE_DIVBYZERO
issue please have a look at [2] and [3].

[1]?http://patchwork.ozlabs.org/patch/562069/
[2] http://lists.busybox.net/pipermail/buildroot/2015-December/146851.h
tml
[3]?http://lists.busybox.net/pipermail/buildroot/2015-December/147156.h
tml

Best regards
J?rg Krause
