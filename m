From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 14:11:26 +0100
Subject: [Buildroot] [PATCH 06/16] uclibc: NPTL thread implementation
 only available on MMU platforms
In-Reply-To: <87vb4l5mjg.fsf@dell.be.48ers.dk>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <87vb4l5mjg.fsf@dell.be.48ers.dk>
Message-ID: <20160317141126.46b73ff2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 13:14:27 +0100, Peter Korsgaard wrote:

> Not related to this commit, but I think we should really remove m68k by
> now - I marked it broken back in 2009 and nobody has cared to fix it:
> 
> commit 8161c45b891aca4c3184c320de81a44767c7cece
> Author: Peter Korsgaard <jacmet@sunsite.dk>
> Date:   Mon Jan 12 20:58:54 2009 +0000
> 
>     buildroot: mark ia64, m68k, nios2, sparc and sparc64 as broken
>     
>     No sense in showing the architecture options when they cannot even build
>     the toolchain.

Let's Cc: Waldemar on this, I believe he has done some work on m68k for
uClibc-ng.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
