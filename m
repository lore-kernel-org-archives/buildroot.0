From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2008 22:24:37 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
In-Reply-To: <1220114542.3307.209.camel@localhost.localdomain> (Ormund
	Williams's message of "Sat\, 30 Aug 2008 12\:42\:22 -0400")
References: <20080826223727.C982F3C7AE@busybox.net>
	<1220114542.3307.209.camel@localhost.localdomain>
Message-ID: <87hc913pbu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:

 >> -LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
 >> +LIBGLIB2_DEPENDENCIES = uclibc gettext libintl libiconv pkgconfig
 >> 
 >> $(eval $(call AUTOTARGETS,package,libglib2))

 Ormund> I'm having a problem with this commit, glib2 fails to build
 Ormund> with this error:

Sorry, my bad. Should be fixed in r23286.

-- 
Bye, Peter Korsgaard
