From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 09:01:33 +0200
Subject: [Buildroot] [PATCH] binutils: add patch to fix AArch64 glibc
 build issue
In-Reply-To: <20140516222751.GF3466@free.fr>
References: <1400169395-11964-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140516222751.GF3466@free.fr>
Message-ID: <20140517090133.6db7d5ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 17 May 2014 00:27:51 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-05-15 17:56 +0200, Thomas Petazzoni spake thusly:
> [--SNIP description of Aarch64 build failures--]
> > Therefore, even though we have not been able to reproduce the issue
> > outside of the autobuilders, and cannot confirm that the patch is
> > fixing the issue, I propose to integrate this binutils patch into
> > Buildroot. It is anyway an upstream binutils patch, which fixes a real
> > problem.
> 
> And it seems it did fix the problem:
>     http://autobuild.buildroot.net/results/820/820d1796c5c09b032efdd10eadc1e61df4c00257

Yes, it did :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
