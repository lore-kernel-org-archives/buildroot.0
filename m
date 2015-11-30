From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 30 Nov 2015 17:18:22 +0100
Subject: [Buildroot] [PATCH] libsigsegv: fix sparc64 compile
In-Reply-To: <87a8pvlaxn.fsf@dell.be.48ers.dk>
References: <20151129145904.GA12312@waldemar-brodkorb.de>
 <87a8pvlaxn.fsf@dell.be.48ers.dk>
Message-ID: <20151130161821.GZ19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > Compile tested for sparc/glibc and sparc64/glibc.
>  > Fixes following autobuilder problem:
>  > http://autobuild.buildroot.net/results/1d8e0c22594aef53f7a4de3491454aa78311c815/
> 
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>  > --- 
>  > Debian has a similar fix, but they don't care for sparc.
> 
> So why do they carry the fix?

Because they care for sparc64 (sparcv9).
 
> Committed, thanks.
> 
> Please try to submit the fix upstream.

Okay, I'll try.

best regards
 Waldemar
