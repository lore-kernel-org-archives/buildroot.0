From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:22:23 +0800
Subject: [Buildroot] [git commit] package/tzdata: install a default
 localtime
In-Reply-To: <20140109205952.2AAEA9C413@busybox.osuosl.org>
References: <20140109205952.2AAEA9C413@busybox.osuosl.org>
Message-ID: <20140110072223.5bb42cc1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 9 Jan 2014 21:23:05 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f96e4d7f348ce1b7b53763f102bbedb1ef6a1991
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Add an option to install a default localtime.
> 
> since tzdata only makes sense for (e)glibc, we don't care
> that we install timezone files that uClibc can't understand.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I know I should have raised my voice earlier, but I'm not entirely sure
about this one. Instead of having this as a tzdata specific option, I'd
very much prefer to have a "System configuration" option that allows to
set the default time zone, and which works for both glibc and uClibc.

Alexandre Belloni has posted some patches some time ago around time
zone handling with uClibc, it would have be great to have a better
integration here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
