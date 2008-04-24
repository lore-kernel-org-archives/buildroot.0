From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 21:04:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20080424184430.B4D613C849@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 24 Apr 2008 11\:44\:30 -0700 \(PDT\)")
References: <20080424184430.B4D613C849@busybox.net>
Message-ID: <87iqy713d1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-24 11:44:30 -0700 (Thu, 24 Apr 2008)
 ninevoltz> New Revision: 21851

 ninevoltz> Log:
 ninevoltz> update qtopia snapshot version and fix problem with qmake
 ninevoltz> generated makefiles being unable to find the toolchain

What about all the config changes? Why don't you comment on them? Why
are you changing it?

 ninevoltz> Modified:
 ninevoltz>    trunk/buildroot/package/qtopia4/Config.in
 ninevoltz>    trunk/buildroot/package/qtopia4/qtopia4.mk


 ninevoltz> Changeset:
 ninevoltz> Modified: trunk/buildroot/package/qtopia4/Config.in
 ninevoltz> ===================================================================
 ninevoltz> --- trunk/buildroot/package/qtopia4/Config.in	2008-04-24 18:35:44 UTC (rev 21850)
 ninevoltz> +++ trunk/buildroot/package/qtopia4/Config.in	2008-04-24 18:44:30 UTC (rev 21851)
 ninevoltz> @@ -12,6 +12,7 @@
 ninevoltz>  	bool "Compile with debug support"
 ninevoltz>  	default n
 ninevoltz>  	depends BR2_PACKAGE_QTOPIA4
 ninevoltz> +	help

Why?

 ninevoltz> +qtopia4-status:
 ninevoltz> +	@echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
 ninevoltz> +	@echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)

What is that for?

-- 
Bye, Peter Korsgaard
