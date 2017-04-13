From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:58:10 +0200
Subject: [Buildroot] [PATCH v2] glibc: fix sh4 compile issue
In-Reply-To: <20170413050732.GA11817@waldemar-brodkorb.de>
References: <20170413050732.GA11817@waldemar-brodkorb.de>
Message-ID: <20170413215810.33e7c197@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 07:07:32 +0200, Waldemar Brodkorb wrote:
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=9756
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied, but there were several issues:

 - First, you still don't use Git to format patches. Please use Git to
   format patches.

 - If you had done that, then the patches would have automatically had
   the original description, which we want to have in Buildroot.

 - Finally, for the 2.23, there was already a 0001-<something> patch,
   so the numbering was wrong.

I've fixed up those issues, see
https://git.buildroot.org/buildroot/commit/?id=5f2cff973a8a64411d85ccb9d5c9a40962d67552.

> In the past I remember some discussions about removing version
> selection for all C libraries. Any idea why we still have more than
> one glibc version?

Historical reason I'd say.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
