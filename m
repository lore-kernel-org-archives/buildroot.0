From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2015 22:24:31 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <20150826184747.GA1934@free.fr> (Yann E. MORIN's message of "Wed, 
 26 Aug 2015 20:47:47 +0200")
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
 <55DB7994.8080509@mind.be> <87vbc3xgcq.fsf@dell.be.48ers.dk>
 <20150826170933.4501e3e8@free-electrons.com>
 <87bnduxe0t.fsf@dell.be.48ers.dk>
 <20150826193251.02c382a3@free-electrons.com>
 <20150826184747.GA1934@free.fr>
Message-ID: <87zj1dx0g0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Yes, it's a pity we can't get the Qt non-free packages. But especially
 > with Qt, they are such a critical piece of a project that I would not
 > want we tell users hat we have such support in Buildroot. That would
 > just be blatantly lying.

 > OTOH, *one* way to which I *may* agree is to add something like

 > In Build options ---> Advanced --->

 >     config UNSUPORTED_NON_PUBLIC_PACKAGES
 >         bool "Show unsupported non-public packages"
 >         help
 >           Some packages do not have publicly accessible source
 >           code, either require registration, manual download...

 >           Buildroot has recipes for building those packages, but
 >           given that their sources ar enot freely available, there
 >           is not guarantee they do work as expected, not even build
 >           at all.

 >           Use at your own risk. Do not report problems to the
 >           Buildroot developpers. Sending patches to fix them might
 >           be accepted.

Another alternative is that somebody maintains a set of BR2_EXTERNAL
packages for this kind of stuff. I'm not sure what the best solution is,
perhaps this is something to discuss during the dev days?

Like with a lot of other things it is a question of tradeoffs. For
users, it is very handy to have the packages available, but as you
mentioned it is hard to really support them. There is imho also value in
trying to convince upstream of these packages to make the sources freely
available / promote the vendors that do..

-- 
Venlig hilsen,
Peter Korsgaard 
