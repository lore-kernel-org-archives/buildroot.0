From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Apr 2012 11:57:32 -0300
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2012.04
In-Reply-To: <87ty058cvj.fsf@macbook.be.48ers.dk>
References: <1335436472-2085-1-git-send-email-gustavo@zacarias.com.ar>
 <20120427150128.77d4636b@eb-e6520> <87ty058cvj.fsf@macbook.be.48ers.dk>
Message-ID: <1bf083affc3ba721a3ac9e1397941db3@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-27 11:31, Peter Korsgaard wrote:

> Yes, but that doesn't affect the tools:
>
> git diff --stat v2012.04..v2012.04.01
>  Makefile                 |    2 +-
>  arch/arm/lib/bootm.c     |   12 +++++++++++-
>  arch/sandbox/cpu/start.c |    6 ------
>  common/main.c            |    3 ++-
>  4 files changed, 14 insertions(+), 9 deletions(-)
>
> But we better update the u-boot package.

Better go for both to keep them in sync.
I'll send patches.
Regards.
