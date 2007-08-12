From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 12 Aug 2007 02:54:36 +0200
Subject: [Buildroot] AUTOTARGETS is not working correctly when applying
In-Reply-To: <40546.127.0.0.1.1186870249.squirrel@localhost>
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
	<20070810185512.GA4186@codepoet.org> <46BE1C56.60508@promwad.com>
	<1186869672.4742.19.camel@elrond.sweden.atmel.com>
	<40546.127.0.0.1.1186870249.squirrel@localhost>
Message-ID: <1186880076.4742.21.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-08-12 klockan 01:10 +0300 skrev Ivan Kuten:
> > l?r 2007-08-11 klockan 23:30 +0300 skrev Ivan Kuten:
> >>
> > This will help, but will make the "package/Makefile.autotools.in" file
> > x11r7 specific.
> >
> >
> 
> May be it makes sense not to introduce x11r7 specific into "package/Makefile.autotools.in"
>  but instead add 2nd param to AUTOTARGETS - package parent. Nobody knows how many packages like
>  x11r7 are going to be introduced.
> 
> $(eval $(call AUTOTARGETS,libxcb,x11r6))
> 
> What do you think?
> 

This requires modifications of all the x11r7 packages
so it is a ton of work.
Good idea - for someone with time...


> BR,
> Ivan
> 
> 
