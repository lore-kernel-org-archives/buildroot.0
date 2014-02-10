From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 13:12:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-09
In-Reply-To: <CAAXf6LWRRpp+WA5J2dV-bPc0te9pBpHN1XBTn=E+Mqqv0of5BA@mail.gmail.com>
References: <20140210073010.EB93B100ECC@stock.ovh.net>
 <CAAXf6LWRRpp+WA5J2dV-bPc0te9pBpHN1XBTn=E+Mqqv0of5BA@mail.gmail.com>
Message-ID: <20140210131255.53f56135@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 10 Feb 2014 12:24:52 +0100, Thomas De Schampheleire wrote:

> > Classification of failures by reason
> > ====================================
> >
> > Makefile.legacy:27: *** "Th... | 994
> 
> :-o
> 
> Problem is:
> "Makefile.legacy:27: *** "The BUILDROOT_DL_DIR environment variable
> was renamed to BR2_DL_DIR.".  Stop."
> so seems like the autobuilders need to be fixed after the recent change...

Problem has been fixed this morning. Sorry, I was away for the
week-end, with no real connection, so I didn't notice until Peter told
me this morning.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
