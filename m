From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 16:42:34 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-lib
In-Reply-To: <20070723133400.GC7902@aon.at>
References: <20070723075415.0C7BDA467A@busybox.net>
	<20070723103336.GA7044@aon.at>
	<1185196685.21840.25.camel@elrond.sweden.atmel.com>
	<20070723133400.GC7902@aon.at>
Message-ID: <1185201754.21840.37.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >
> >make install is done on the staging dir.
> 
> make install != install(1)
> man install
> $(INSTALL) -D /thisfile /thatfile /there/newdir
> or something like that.
> 
> >I think the reason for not doing make install on the target dir is
> >that it will add a lot of other stuff which is not wanted on an embedded
> >system.
> 
> This is unrelated but true, yes :)
> 
> >It is a matter of taste if you "install and remove", or just copy
> >the *needed* stuff. 
> 
> I prefer to just copy the needed stuff.
> 
> >Have to discuss with Someone Else(tm) if you insist.
> 
> Just using install(1) for new packages -- and eventually gradually
> fixing old ones -- is sufficient. We can easily either use busybox's
> install or have our own in buildroot to circumvent eventual buggy
> incarnations on the host. This would also help the MacOS10 folks, i'd
> say.

OK, I'll look into it, but I guess the x86 test will take priority for
the moment...

Best Regards
Ulf Samuelsson
