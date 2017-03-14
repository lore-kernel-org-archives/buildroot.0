From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 13:40:12 +0100
Subject: [Buildroot] [Patch v3 6/9] s6-rc: new package
In-Reply-To: <87wpbsyfed.fsf@dell.be.48ers.dk>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-7-git-send-email-eric.le.bihan.dev@free.fr>
 <20170309233312.2c10dee9@free-electrons.com>
 <87wpbsyfed.fsf@dell.be.48ers.dk>
Message-ID: <20170314134012.53f73fd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 23:34:50 +0100, Peter Korsgaard wrote:

>  > On Mon, 19 Dec 2016 22:29:12 +0100, Eric Le Bihan wrote:  
>  >> This new package provides s6-rc, a service manager for s6-based systems,
>  >> i.e. a suite of programs that can start and stop services, both
>  >> long-running daemons and one-time initialization scripts, in the proper
>  >> order according to a dependency tree.
>  >> 
>  >> The host variant is provided so s6-rc-compile is available and can
>  >> be used to build the services database offline, either in a package
>  >> Makefile or a post-build script.  
> 
> Hmm, shouldn't it then have a Config.in.host so it can be enabled for
> post-build scripts?

Indeed. I guess that's something Eric can improve in a follow-up patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
