From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 29 Sep 2010 01:26:20 +0200
Subject: [Buildroot] Libtool work: a tentative summary
In-Reply-To: <20100928223652.6dc72083@surf>
References: <20100928223652.6dc72083@surf>
Message-ID: <1285716380.27944.302.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot to Thomas, for having made this summary.

Le mardi 28 septembre 2010 ? 22:36 +0200, Thomas Petazzoni a ?crit :
> 
> Drawbacks of this approach :
> 
>  *) We need to autoreconfigure *ALL* autotools-based packages. This may
>     be an issue for two reasons: 1/ speed, 2/ packages for which
>     autoreconfiguration does not work properly (yes those packages
>     should be fixed, but anyway, this may add some work to us).
>     Obviously, as packages will start using libtool 2.4 by default,
>     this shouldn't be a problem, but we all know that it's going to
>     take years before everybody moves to that newer libtool version.

To be correct, autoreconfigure would not apply to all autotools-based
packages, but just to autotools-based ones using libtool. For example,
the at package which uses autotools, wouldn't require to be
autoreconfigured to work properly.
I confess that packages using libtool represent the majority of the
packages, and surely the most complex ones to autoreconfigure.

Regards,

--
Lionel Landwerlin
