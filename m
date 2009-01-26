From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 20:02:57 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus-glib
In-Reply-To: <87r62q6pla.fsf@macbook.be.48ers.dk>
References: <20090120213244.B1DB2770AD@busybox.osuosl.org>
	<87hc3tvbkx.fsf@macbook.be.48ers.dk>
	<87r62q6pla.fsf@macbook.be.48ers.dk>
Message-ID: <1232996577.2298.96.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 16:42 +0100 skrev Peter Korsgaard:
> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>  ulf> Log:
>  ulf> Libraries for dbus-glib are in /usr/lib, depend on expat
> 
>  ulf> -dbus-glib: uclibc pkgconfig dbus libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
>  ulf> +dbus-glib: uclibc pkgconfig dbus expat libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
> 
>  Peter> Dbus can be compiled with either expat or libxml2 support - How does
>  Peter> that fit with this?
> 
> Ping?
> 

Did not have time to look into this.
IIRC it was trying to use -lexpat
and -lexpat was not available.

BR
Ulf Samuelsson
