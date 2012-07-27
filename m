From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 10:39:46 +0200
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <50125101.8080300@mind.be>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
 <50117709.8060209@mind.be> <20120727084503.045fbb14@skate>
 <50125101.8080300@mind.be>
Message-ID: <20120727103946.08887d2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 10:27:45 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I think it depends a bit on the situation.  For openssl support, it
> makes more sense to just add it when available, because it normally
> doesn't increase the size of the binary (much) to have openssl support
> enabled.
> 
>   However, sconeserver (and vlc as well) are modular packages, which
> you can basically view as a collection of sub-packages.  So in that
> case, it does make more sense to select which modules you want to have
> enabled.
> 
>   So for sconeserver, I prefer to keep all the sub-options.  Except
> maybe the SSL module, that's not really a separate server but a
> library wrapper, so it should probably be selected automatically if
> openssl is.

So the patch should be adjusted for the SSL case at least.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
