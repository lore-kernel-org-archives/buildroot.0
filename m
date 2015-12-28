From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 23:37:27 +0100
Subject: [Buildroot] [git commit] emlog: new package
In-Reply-To: <5681B510.2020702@mind.be>
References: <20151222165921.0C82082302@busybox.osuosl.org>
 <5681B510.2020702@mind.be>
Message-ID: <20151228233727.73acae42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 28 Dec 2015 23:17:52 +0100, Arnout Vandecappelle wrote:
> On 22-12-15 17:58, Thomas Petazzoni wrote:
> > +EMLOG_DEPENDENCIES = linux
> 
>  Thomas, shouldn't this be added already by the kernel-module infra?

You are obviously absolutely right, so we need to remove it from here.
If nobody cooks a patch for it, I'll remove it tomorrow.

Thanks for spotting this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
