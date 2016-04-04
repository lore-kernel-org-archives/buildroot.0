From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 4 Apr 2016 21:43:44 +0200
Subject: [Buildroot] [PATCH] opencv: fix sparc64 compile
In-Reply-To: <5702C33D.80608@mind.be>
References: <20160403110913.GA19849@waldemar-brodkorb.de>
 <5702C33D.80608@mind.be>
Message-ID: <20160404194344.GB5944@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> On 04/03/16 13:09, Waldemar Brodkorb wrote:
> >This patch from Debian fixes following autobuild failure:
> >http://autobuild.buildroot.net/results/eda5c6c43da40a342e0f545a348d2f865eb5ccf2/
> >
> >Tested with ARM build without a regression.
> >
> >Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> >---
> >  package/opencv/0002-atomic.patch | 222 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 222 insertions(+)
> >  create mode 100644 package/opencv/0002-atomic.patch
> >
> >diff --git a/package/opencv/0002-atomic.patch b/package/opencv/0002-atomic.patch
> >new file mode 100644
> >index 0000000..607d3fd
> >--- /dev/null
> >+++ b/package/opencv/0002-atomic.patch
> >@@ -0,0 +1,222 @@
> >+Bug#714923: opencv FTBFS on sparc64
> >+https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1393793.html
> >+
> 
>  You should sign off the patch. It is also missing a description of what is
> wrong and how it is fixed.

Thanks for the review.
I thought Signed-off-By is only used if I made the patch and not if
I copy the patch from some internet site.
 
>  Also please refer to the bug tracker itself rather than the mail archive:
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=714923
> 
>  The first message there contains a nice description of the problem that you
> can reuse in the patch.

Okay,

Waldemar
