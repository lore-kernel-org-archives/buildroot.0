From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 May 2015 09:31:29 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87r3qsnamm.fsf@dell.be.48ers.dk>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
 <20150507000102.1c814d69@free-electrons.com>
 <87r3qsnamm.fsf@dell.be.48ers.dk>
Message-ID: <20150507093129.08aa1b47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, 07 May 2015 08:51:29 +0200, Peter Korsgaard wrote:

>  > My suggestion would therefore be to change host-autoconf-archive to
>  > install in a path that isn't in the standard include path of
>  > autoreconf/aclocal. This way, no package doing AUTORECONF = YES would
>  > be "polluted" by the presence of host-autoconf-archive. And only those
>  > few packages that actually need host-autoconf-archive can add the
>  > relevant -I option to AUTORECONF_OPTS. I've tested that installing
>  > host-autoconf-archive to a custom location works, but I haven't tested
>  > the other part of the solution.
> 
>  > Thoughts?
> 
> Yes, that also sounds like the best approach to me. Will you send a
> patch to do so?

I'll try, but I'm not sure when I'll have the time to do so. It might
have to wait until next week.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
