From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 8 Dec 2016 03:37:02 +0100
Subject: [Buildroot] [PATCH v2 next] uclibc-ng-test: new package
In-Reply-To: <20161207232700.189ff80e@free-electrons.com>
References: <20161118060348.GA11282@waldemar-brodkorb.de>
 <20161207232700.189ff80e@free-electrons.com>
Message-ID: <20161208023702.GH8584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 18 Nov 2016 07:03:48 +0100, Waldemar Brodkorb wrote:
> > The next release of uClibc-ng (1.0.20) will remove the test suite.
> > Add a separate package before the next release.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> This new package causes quite a few build failures:
> 
>   http://autobuild.buildroot.net/?reason=uclibc-ng-test-4ad1c23ae2eb30888cda520c739cc26150512487

Yes, seen them and they are on my TODO.
 
> Could you have a look?

A first patch sent out, hopefully fixing some of them.

best regards
 Waldemar
