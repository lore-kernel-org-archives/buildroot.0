From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 10 Feb 2017 08:34:39 +0100
Subject: [Buildroot] [PATCH 6/6] package/mpd: add choice between version
 0.19 and 0.20
In-Reply-To: <20170209213445.4b012033@free-electrons.com>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-7-joerg.krause@embedded.rocks>
 <20170209213445.4b012033@free-electrons.com>
Message-ID: <1486712079.26171.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2017-02-09 at 21:34 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,??9 Feb 2017 18:47:59 +0100, J?rg Krause wrote:
> > MPD version 0.20 being affected by GCC PR libstdc++/64735 means no
> > mpd
> > package available in Buildroot for the architectures NIOSII, ARMv4,
> > ARMv5 and SPARCv8 until GCC 7 is released.
> > 
> > As the next Buildroot release is in 2017.02 which is before GCC 7
> > is
> > expected to be released add a choise between version 0.19 and 0.20,
> > so
> > that there is still an mpd package available for the affected
> > architectures.
> > 
> > Note, that we bumped the version from 0.19 to 0.20 within the
> > current Buildroot
> > release cycle.
> > 
> > Note, that for the version 0.19 MPD requires libglib2.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> I am not sure we want to support a version choice for mpd just for
> the
> sake of NIOSII, ARMv4, ARMv5 and SPARCv8.
> 
> I'll let Peter Korsgaard decide if he believes this is worth the
> additional complexity.

Just noticed I forgot the hash for mpd 0.19. If Peter decides to accept
this patch, I can send an updated version.

J?rg
