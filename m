From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Jul 2010 12:00:26 -0300
Subject: [Buildroot] ppp
In-Reply-To: <4C30BFE5.4080902@tiedyenetworks.com>
References: <4C30BFE5.4080902@tiedyenetworks.com>
Message-ID: <4C470B8A.7030402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/2010 02:07 PM, mike wrote:

>    Related to ppp, rp-pppoe also shouldn't be depreciated since
> pppoe-server is so useful, and in fact should be updated as well. I have
> a fixed package for that too as well as some feature additions to
> support pppoe intermediate agent tags. For ppp I also have support for
> gigawords (radius accounting, 64bit ints instead of 32). Does buildroot
> want original author only pristine packages without feature
> enhancements, or will it accept package submissions with additional
> patches?
> Mike-

Yes, rp-pppoe has a use as server-side pppoe.
To get it back into shape it needs to get converted to autotargets
(right now it's an old-style package and we want to get rid of those)
and also upgraded to the latest version.
Features can be accepted if the upstream maintainer(s) of the package
accepts them too for a future release.
Patches that fix bugs are always welcome. They should be reported
upstream too.
Regards.
