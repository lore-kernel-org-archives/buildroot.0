From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 19:04:49 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
 by webkit)
In-Reply-To: <87ws1ryd6v.fsf@macbook.be.48ers.dk>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
	<20091115152653.29810036@surf> <1258299584.24296.91.camel@coalu.atr>
	<87ws1ryd6v.fsf@macbook.be.48ers.dk>
Message-ID: <1258308289.24296.94.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dimanche 15 novembre 2009 ? 17:18 +0100, Peter Korsgaard a ?crit :
> >>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:
> 
> Hi,
> 
>  >> BTW, why do we need to build flex for the host ? flex is part of the
>  >> few tools that we consider to be a dependency of Buildroot.
> 
>  Lionel> It's required to build webkit. I didn't notice the problem until I built
>  Lionel> it on a host system where it wasn't installed.
> 
> Didn't the dependencies.sh check error out?
> 
> sudo mv /usr/bin/flex{,-backup}
> make
> 
> flex installed:             FALSE
> 
> 
> You must install 'flex' on your build machine
> 
> make: *** [dependencies] Error 1
> 

I will recheck again tomorrow, it was on a machine at work (RH
enterprise 5).

By the way, what's the policy about host packages that should be
included in buildroot ?

Regards,

-- 
Lionel Landwerlin
