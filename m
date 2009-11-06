From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 06 Nov 2009 10:02:24 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<1257497536.1962.15.camel@bender>
	<op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
Message-ID: <1257498144.1962.18.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-11-06 at 09:59 +0100, Joachim Pihl wrote:

> > glib is http://library.gnome.org/devel/glib/stable/glib.html and should
> > not be confused with glibc.
> >
> > I assume that some package you selected pulled in libglib2, which itself
> > pulls in other things like iconv. Just check your package selection and
> > make sure that you only select the packages you absolutely need.
> 
> 
> Thanks for clearing that up! I found glib_genmarshal in /usr/bin, but I  
> have absolutely no idea of why it has been included. There is no package I  
> can find that mentions it. Also, this does not explain the duplicate  
> libstdc++ libraries.

glib-genmarshal should only be installed in the host directory, not in
the target directory. Are you absolutely sure you are looking at the
right folder?


Sven
