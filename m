From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 09:47:25 +0200
Subject: [Buildroot] [RFC] Move host-pkgconf dependency to
 package/pkg-autotools.mk
In-Reply-To: <55284115.40309@mind.be>
References: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150410141217.4bd2547c@free-electrons.com>
 <55284115.40309@mind.be>
Message-ID: <20150411094725.5c29b312@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, 10 Apr 2015 23:31:01 +0200, Arnout Vandecappelle wrote:

>  I agree that something like that is the way to go.
> 
>  However, I would prefer that this kind of stuff:
> 
> - goes into scripts in the support/ directory;
> 
> - gets called from the GLOBAL_INSTRUMENTATION_HOOKS;
> 
> - is selectable with a config option in the Build options menu (which would be
> enabled by the autobuilders).
> 
>  My reasoning is that the BR infrastructure is already pretty darn complicated,
> so it would be good to separate the core infrastructure from the fringe stuff.
> And the config option is of course because I prefer to keep the developer stuff
> out of the way of normal users.

I fully agree with these suggestions. I think you already made them on
my previous posting of a patch doing this check, and it's just that I
haven't taken the time to prepare a new version of the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
