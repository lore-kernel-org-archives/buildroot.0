From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:36:37 +0100
Subject: [Buildroot] [PATCH] legal-info: extract even no-redistribute
 packages
In-Reply-To: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
References: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140301143637.440c054a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 28 Feb 2014 17:45:56 +0100, Yann E. MORIN wrote:

> Fix this by always having legal-info extract the archives if one or
> more _LICENSE_FILES are specified.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/884/884ba13bb024fd9a4818f3184495b2cccc3f595e/
>     http://autobuild.buildroot.net/results/b6e/b6e152ce117764337c243a9f356b32064106f5c3/
>     http://autobuild.buildroot.net/results/a58/a588b3b535a1259f7bc110a6323e5f33830bcd94/
>     http://autobuild.buildroot.net/results/6d5/6d5da7fe5aee871d98fd5503875453556ccbf854/
>     [...]

This patch is not actually fixing those build failures: they were
really caused by "make" not doing anything when no filesystem image
format was selected. Though the problem is real, and the patch
definitely valid.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
