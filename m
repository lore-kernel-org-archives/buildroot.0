From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Wed, 22 Jul 2015 12:04:34 +0200 (CEST)
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <1530706203.3889145.1437559474733.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> >          arm |                   cppcms-1.0.4 | NOK |
> >          http://autobuild.buildroot.net/results/58d3d2605337fe1ce49d333cb712941711276100/
> 
> Weird C++ problem:
> 
>   error: 'template<class T, class A> std::size_t
>   cppcms_boost::hash_value' conflicts with a previous declaration
> 
> Nicolas, you are the original submitter of cppcms, can you have a
> look?
> 

I just reproduced the problem but I have a different compilation error on my workstation:
error: ?converter_to_utf? was not declared in this scope
error: ?converter_between? was not declared in this scope

I added in CC Lucile which added the support of uCLibc, in the case she would have an idea of what is going on.

I continue to investigate on this problem. 

Thanks a lot,
Nicolas.
