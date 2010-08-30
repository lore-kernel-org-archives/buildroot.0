From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Aug 2010 18:29:55 +0200
Subject: [Buildroot] systemtap support?
In-Reply-To: <i5gkb0$72g$1@dough.gmane.org>
References: <i58qcn$k3i$1@dough.gmane.org> <i5gj7q$tev$1@dough.gmane.org>
	<i5gkb0$72g$1@dough.gmane.org>
Message-ID: <20100830182955.42d397ea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Aug 2010 15:56:17 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> >   ac_cv_file__usr_include_nspr=no \
> >   ac_cv_file__usr_include_nspr4=no \
> >   ac_cv_file__usr_include_nss=no \
> >   ac_cv_file__usr_include_nss3=no \
> >   ac_cv_func_malloc_0_nonnull=yes ./configure
> >
> > How do you pass environment variables to the configure script when
> > using AUTOTARGETS?  
> 
> Never mind, I finally noticed xxxx_CONF_EVN in the documentation.

Correct, <pkg>_CONF_ENV is the variable to use to pass such variables.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
