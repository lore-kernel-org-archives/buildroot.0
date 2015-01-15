From: Bill Borton <security@conwin.com>
Date: Thu, 15 Jan 2015 09:19:49 -0600
Subject: [Buildroot] Using a local kernel tarball?
In-Reply-To: <18C83A04-432F-4D73-ADAC-ED64715C267E@gmail.com>
References: <20150113131925.58ca1219@black>
 <18C83A04-432F-4D73-ADAC-ED64715C267E@gmail.com>
Message-ID: <20150115091949.48929a49@black>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you sir.

That was actually one of the first things I tried:
"file://board/company/product/kernel.tar.bz"
which doesn't work. I also tried ../ and ../../

With your suggestion I went back and tried again:
"file://../../../board/company/product/kernel.tar.bz"
Does the trick...

I knew there must be a simple solution.

Thanks again,
-Bill


On Wed, 14 Jan 2015 22:15:02 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> Hi Bill,
> 
> On January 13, 2015 8:19:25 PM CET, Bill Borton <security@conwin.com> wrote:
> >Hi guys,
> >
> >It would appear I can use a local directory, repository or a custom
> >tarball URL... but not a local tarball?
> >
> >If my kernel src is in say
> >buildroot/boards/company/product/kernel.tar.bz how do I tell Buildroot
> >to use it?
> >
> >I'm betting I've missed something obvious...
> 
> Use file:// as URL prefix to point to a local file...
> 
> Best regards,
> Thomas
