From: Adam Hawes <adam@infocab.com.au>
Date: Fri, 07 Sep 2007 11:30:56 +0930
Subject: [Buildroot] Qtopia 4.3.1 on X86
In-Reply-To: <46DFB041.1030509@st.com>
References: <1189062690.13373.11.camel@cyclops.infocab.com.au>
	<46DFB041.1030509@st.com>
Message-ID: <1189130456.18603.32.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the pointers.  I've changed the uClibc configuration to
remove SUSv3 macros and Qtopia builds.  I have only found one breakage
so far and that's in mplayer.  I'll work toward fixing that if I can
find a little bit of time.

Cheers,
A


On Thu, 2007-09-06 at 09:46 +0200, Carmelo AMOROSO wrote:
> Adam Hawes wrote:
> > Hi,
> >
> > I'm trying to build Qtopia in Buildroot for X86.  I've had a lot of
> > issues with "macro index requires 2 arguments...".  The only solution
> > I've found is to undefine that macro in all the files where it
> > complains.
> >
> > Has anyone else found a more elegant solution to this problem? Is there
> > a patch available or should I submit my patch to Qtopia to the list?
> >
> > Cheers,
> > A
> >
> >   
> The problem is that you have uClibc configure with SUSv3_LEGACY_MACRO on 
> that define index.
> 
> Carmelo
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> >   
> 
> 
