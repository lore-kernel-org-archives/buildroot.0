From: hartleys <hartleys@visionengravers.com>
Date: Tue, 22 Apr 2008 13:59:01 -0400
Subject: [Buildroot] trouble building grep
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950ABFA085@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm trying to cross compile grep for an ARM processor and have a problem
I can't work out.

As far as I can tell the dependants (uclibc, gettext and libintl) are
being built with no problem. When the make runs for grep it appears to
get configured fine but during the actual build I get error messages
that I think are during the link of libgreputils.a. I get undefined
reference messages for libintl_gettext at various lines in the source
then the build stops. 

I'm kind of stuck. Any ideas what the problem could be? I already
checked my $(STAGING_DIR)/usr/lib directory and the libgettext and
libintl files are there.

Thanks,
Hartley
