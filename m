From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:10:46 +0100
Subject: [Buildroot] [PATCH v2 1/2] Opentracing: add opentracing-cpp
 v1.2.0 package
In-Reply-To: <CAGszK3g5-MyNQKQkOAb6F021iShcvF0Dgxhi8nJVE9ZUeN+AuA@mail.gmail.com>
References: <1513849309-550-2-git-send-email-heyleke@gmail.com>
 <1514014802-23736-1-git-send-email-heyleke@gmail.com>
 <1514014802-23736-2-git-send-email-heyleke@gmail.com>
 <20171230224628.746682f5@windsurf>
 <CAGszK3iD7PYCjtekPy2DxXnu3VpYto9bQsb_R20+GuVM9P4WtQ@mail.gmail.com>
 <CAGszK3jy2faOBddMzamf9-0H9MuDxBP847vS22u3n2dH8GCc0Q@mail.gmail.com>
 <CAGszK3jYUcxxKit8SjH3biCR66WgaQLm7X4dVBF0pe8KfCbapQ@mail.gmail.com>
 <CAGszK3g5-MyNQKQkOAb6F021iShcvF0Dgxhi8nJVE9ZUeN+AuA@mail.gmail.com>
Message-ID: <20171231171046.1b6b5036@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 14:23:06 +0100, Jan Heylen wrote:
> I found that this issue has actually a feature in buildroot:
> 
> BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
> I'll dig some deeper into that and propose a new version of the patch.

Indeed! I forgot about this one. So just make your package depends
on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735.

Could you resubmit, taking into account this issue, and the few other
comments that I made ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
