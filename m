From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 13:06:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-03-27
In-Reply-To: <871sth6fcj.fsf@dell.be.48ers.dk>
References: <20170328062859.9F1EC207EA@mail.free-electrons.com>
 <871sth6fcj.fsf@dell.be.48ers.dk>
Message-ID: <20170328130638.62750436@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Mar 2017 09:16:28 +0200, Peter Korsgaard wrote:

>  > Hello,
>  > Build statistics for 2017-03-27
>  > ================================  
> 
>  >       successes : 119
>  >        failures : 29 
>  >        timeouts : 0  
>  >           TOTAL : 148  
> 
> FYI, it seems like gcc10 is not getting fixed, so I've instead started
> an autobuilder on gcc16 and the number of daily builds should again
> increase.

Great, thanks!

On my side, the Free Electrons build server has moved to systemd, and
due to this, the autobuild-run script is no longer being restarted
automatically when the build server is restarted after security
updates. Therefore, there are times where this build server is no
longer contributing build results.

I'll try to fix that soon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
