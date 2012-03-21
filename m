From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 10:42:12 +0100
Subject: [Buildroot] Random build results now available online
In-Reply-To: <87fwd25mne.fsf@macbook.be.48ers.dk>
References: <20120321101327.49d34f93@skate>
 <87fwd25mne.fsf@macbook.be.48ers.dk>
Message-ID: <20120321104212.553e3805@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 10:27:49 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> This week-end, I want ahead and implemented something. The results of
>  Thomas> both Peter builds and my builds are now visible online at:
> 
>  Thomas>  http://buildroot.humanoidz.org/
> 
> Once again, thanks!
> 
> How about adding a .buildroot.{net,org} DNS entry for it, though? How
> about autobuild.buildroot.{net,org} or something like that?

As discussed on IRC, done on my side (Apache configuration). Provided
the DNS entries are added and pointed to 213.246.36.146, it should work.

>  Thomas> The website along with all build results are currently hosted on a
>  Thomas> personal server. If there a wish to migrate this on a more common
>  Thomas> server, I'll be happy to do so, provided that this server has the
>  Thomas> necessary ressources (dependencies and disk space).
> 
> We can perhaps talk with the osuosl.org guys about that.

Right. I have no problem to continue hosting this, it's just that I
think things are better if they are centralized on a server that
at least a few Buildroot developers have access to.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
