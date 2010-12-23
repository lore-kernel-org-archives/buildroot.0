From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:30:51 +0100
Subject: [Buildroot] [PATCH 01/13] portmap: install initscript
In-Reply-To: <87bp4dtmun.fsf@macbook.be.48ers.dk>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
	<87bp4dtmun.fsf@macbook.be.48ers.dk>
Message-ID: <20101223083051.6b22cf0f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Dec 2010 00:21:52 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Gustavo> Thanks to patrick.ziegler at fh-kl.de in the mailing list for
>  Gustavo> noticing. Signed-off-by: Gustavo Zacarias
>  Gustavo> <gustavo@zacarias.com.ar> ---
>  Gustavo>  package/portmap/portmap.mk |    2 ++
>  Gustavo>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> Thanks, committed the entire series + the 6 extra patches you have
> added to the branch in the mean time.

I'd prefer if all patches were sent to the list, unless they are really
trivial. The "icu" package conversion for example, wasn't really
trivial.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
