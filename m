From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 10 Aug 2015 20:01:53 +0200
Subject: [Buildroot] [PATCH] empty: fix compile with toolchain w/o
	threads
In-Reply-To: <20150808124622.7837de9c@free-electrons.com>
References: <20150709093140.GA8600@waldemar-brodkorb.de>
 <20150808124622.7837de9c@free-electrons.com>
Message-ID: <20150810180152.GU8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Thu, 9 Jul 2015 11:31:40 +0200, Waldemar Brodkorb wrote:
> > As found via autobuilders and discussed on the list, the
> > ifdef is wrong, as empty uses SysV semaphores and not POSIX
> > semaphores.
> > 
> > Tested with glibc/uclibc-ng builds. And with uclibc-ng without
> > threads.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/empty/0002-fix-non-thread-build.patch |   49 +++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 package/empty/0002-fix-non-thread-build.patch
> 
> Applied, thanks. Could you submit the patch upstream?

I sent it to Mikhail Zakharov and he mailed me back that he has
applied it.

best regards
 Waldemar
