From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2011 16:56:26 +0200
Subject: [Buildroot] Suggestion for easier bumping of Xorg packages
In-Reply-To: <20110805145820.3bbf8170@gmail.com>
References: <20110805145820.3bbf8170@gmail.com>
Message-ID: <20110805165626.26bd3b02@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 5 Aug 2011 14:58:20 +0200,
Frederic Bassaler <frederic.bassaler@gmail.com> a ?crit :

> What about reorganizing the package/x11r7 subdir?
> 
> ie. instead of having everything in the same directory :
> 
> xapp_xxx
> ...
> xdriver_xxxx
> ...
> xfont_xxx
> 
> maybe it could be clearer to have the same subdirs as the
> http://xorg.freedesktop.org/releases/individual/ tree

Yeah, why not, but...

> so that we can bump up versions easier? (one subdirectory after
> another since there are many packages)

... what does this change to the problem of bumping the packages?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
