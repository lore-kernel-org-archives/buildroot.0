From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 Sep 2009 19:09:21 +0200
Subject: [Buildroot] [git commit master] iptables: use multipurpose
 binaries and bump version
In-Reply-To: <87vdjizz34.fsf@macbook.be.48ers.dk>
References: <20090916065152.259397779D@busybox.osuosl.org>
	<20090916074918.GB26922@mx.loc>
	<87vdjizz34.fsf@macbook.be.48ers.dk>
Message-ID: <20090916170921.GG30991@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 16, 2009 at 05:30:39PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
> >> - bump version to 1.4.4
>
> Bernhard> can you please make that 1.4.5?
>
>I gave it a quick try, but:
>
>./.libs/libxtables.so: undefined reference to `in6addr_any'
>collect2: ld returned 1 exit status
>make[3]: *** [iptables-multi] Error 1
>make[3]: *** Waiting for unfinished jobs....
>
>So unless anyone wants to fix that up (I don't use iptables), then I'll
>prefer to keep it at 1.4.4.

This was supposed to be fixed already. Olaf, could you please reopen
http://bugzilla.netfilter.org/show_bug.cgi?id=588
