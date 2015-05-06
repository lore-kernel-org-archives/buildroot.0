From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 6 May 2015 19:53:30 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150506094236.114894a2@free-electrons.com>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
Message-ID: <20150506175329.GQ8309@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> >          arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
> >          arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/
> 
> error: unknown type name 'ucontext_t'
> 
> Happens with uClibc-ng only it seems. Waldemar, can you have a look?

Patch sent. A symbol in the config is required to enable these
needed SuSv3 functions. Fixes also the mongrel2 compile errors.

best regards
 Waldemar
