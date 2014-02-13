From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 14:55:26 +0100
Subject: [Buildroot] [PATCH 2/6] docs/manual: indicate how to handle
 BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <CAAXf6LWGG+8+EW9vVNMpVuYftFsOD23MmEy7ZJpBUv_3y2GMdQ@mail.gmail.com>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392297727-17627-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LWGG+8+EW9vVNMpVuYftFsOD23MmEy7ZJpBUv_3y2GMdQ@mail.gmail.com>
Message-ID: <20140213145526.59af1147@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 13 Feb 2014 14:46:00 +0100, Thomas De Schampheleire wrote:

> >  * thread support
> >  ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
> > -** Comment string: +threads+
> > +** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
> > +   is also needed, in which case, specifying only +NPTL threads+ is
> > +   sufficient)
> > +
> > +* NPTL thread support
> > +** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
> > +** Comment string: +NPTL threads+
> >
> >  * RPC support
> >  ** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
> 
> Should we maybe use 'NPTL' rather than 'NPTL threads' to make the
> string shorter? (we want to fit in 80chars).
> It's true that it's a bit more cryptic, but so is RPC, wchar, etc.
> The biggest point is that a user can go to the Toolchain menu and
> recognize a string that matches, in this case the keyword NPTL.

Fine with me. I'll adjust that in the v2, but I'll wait a little bit
more for other comments, if any :)

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
