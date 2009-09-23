From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 23 Sep 2009 16:01:31 +0200
Subject: [Buildroot] use of HOST_GLIB
In-Reply-To: <8763b9rfde.fsf@macbook.be.48ers.dk>
References: <1253706849.1618.60.camel@sven>
	<8763b9rfde.fsf@macbook.be.48ers.dk>
Message-ID: <1253714491.1618.68.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2009-09-23 at 14:54 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> Hi,
>  Sven> I found that package/java/classpath and package/libsoup both use
> 
>  Sven>  ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal
> 
>  Sven> However HOST_GLIB does not seem to be defined. What is the proper
>  Sven> way to refer to the glib-genmarshal binary that is installed by
>  Sven> the host-libglib2 target?
> 
> Ahh, those must have been missed when we fixed the glib-genmarshal
> stuff. The proper variable to use is LIBGLIB2_HOST_BINARY.

That is a rather strange name. Nothing in LIBGLIB2_HOST_BINARY tells me
that this is glib-genmarshal. What's the variable to use for
glib-mkenums then ?


Sven
