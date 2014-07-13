From: Mike Zick <minimod@morethan.org>
Date: Sat, 12 Jul 2014 20:54:30 -0500
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <20140712215353.GD3582@free.fr>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <20140712215353.GD3582@free.fr>
Message-ID: <20140712205430.1abdf0bf@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Jul 2014 23:53:53 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > https://bugs.busybox.net/show_bug.cgi?id=7172 major
> > unassigned at buildroot.uclibc.org Name collision of rpath token
> > expansion and internal variables
> > The puzzle pieces for a solution are present in this bug report. All
> > it needs is someone caring enough to create a proper patch for this.
> > Any candidates?  
> 
> I'm not a fan of all this rpath trickery.
> 
> Basically, the submitter (probably) wants this to run his
> buildroot-built system from somewhere else than / and does not want to
> chroot into it.
> 
> Should we add complexity to Buildroot for this use-case?
>

Some members here in the past have expressed interest in supporting
after-market firmware creation for consumer devices.

Most have remained non-committal.

Buildroot does provide the string field for the end-user to pass
custom link-time options.

The point is, it should either work or be documented as to its
limitations.
That meets any definition of a "bug" in Buildroot.
Not a "unsupported use case", a "bug", as in "broke" by implementation".

I would be glad to fix it for you if I could.

Mike
