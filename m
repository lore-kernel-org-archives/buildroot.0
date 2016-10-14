From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 16:50:24 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: synchronize pkg-config
	settings between HOST_{CONFIGURE_OPTS, MAKE_ENV}
In-Reply-To: <20161014140944.9436-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Oct 2016 16:09:44 +0200")
References: <20161014140944.9436-1-peter@korsgaard.com>
Message-ID: <87r37j56j3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The pkg-config settings in HOST_CONFIGURE_OPTS and HOST_MAKE_ENV have
 > diverged over time, so they now used different _LIBDIR and
 > _ALLOW_SYSTEM_{CFLAGS,LIBS} settings.

 > Conceptually _CONFIGURE_OPTS should be a superset of _MAKE_ENV, so move the
 > definitions around and define _CONFIGURE_OPTS in terms of _MAKE_ENV instead
 > of repeating the individual settings.

 > Do this both for the target and host variant for consistency.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
