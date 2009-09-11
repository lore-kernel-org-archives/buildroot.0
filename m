From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 11 Sep 2009 17:17:24 +0200
Subject: [Buildroot] Yaboot doesn't build
In-Reply-To: <94D3F226-C067-4F83-8F86-17BF467035B7@earthlink.net>
References: <94D3F226-C067-4F83-8F86-17BF467035B7@earthlink.net>
Message-ID: <20090911151724.GC29175@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 10, 2009 at 12:44:50PM -0400, Steve Bennett wrote:
>Hi all!
>
>Am trying to build a PowerPC boot CD with buildroot, and YABOOT
>doesn't seem to build in the latest buildroot.  I get the following
>error:

I suggest you get the 1.3.13 version from
http://repo.or.cz/w/buildroot.git?a=tree;f=target/powerpc/yaboot;hb=HEAD
and look at
http://repo.or.cz/w/buildroot.git?a=tree;f=package/e2fsprogs;hb=HEAD

and submit it to Peter for inclusion.

>Is that the right approach here, or am I missing something?   Anyone
>care to nudge me in the right direction as to how to accomplish this?

HTH,
