From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 08:44:32 +0100
Subject: [Buildroot] [git commit] qextserialport: don't require Qt GUI
 module
In-Reply-To: <87k3tmysez.fsf@dell.be.48ers.dk>
References: <20121114214738.427A799B26@busybox.osuosl.org>
 <50A580BA.5020402@mind.be> <87k3tmysez.fsf@dell.be.48ers.dk>
Message-ID: <20121116084432.6dde4f80@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 16 Nov 2012 07:26:44 +0100, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  Arnout>  While we're at it, we could also throw out our patching of the
>  Arnout> platform-specific qws config file: we are anyway replacing all
>  Arnout> "interesting" variables with our own values, so all useful
>  Arnout> content is thrown away.  Instead, we could make our own spec
>  Arnout> file that contains exactly what we need:
> 
>  Arnout> include(../../common/linux.conf)
>  Arnout> include(../../common/gcc-base-unix.conf)
>  Arnout> include(../../common/g++-unix.conf)
>  Arnout> include(../../common/qws.conf)
>  Arnout> <our stuff goes here>
>  Arnout> load(qt_config)
> 
>  Arnout>  What do you think?
> 
> I'm no Qt expert, but it sounds sensible - Thomas?

I don't remember all the details of those spec files, but yes, it
sounds good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
