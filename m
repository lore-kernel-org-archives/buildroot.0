From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jan 2018 21:27:15 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Fix toolchain to create
 proper builds for MIPS XBurst targets
In-Reply-To: <1515170305-25742-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1515170305-25742-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20180105212715.5e50d391@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is PATCH 2/2, we haven't received PATCH 1/2 in the mailing list.
Where is it?

On Fri,  5 Jan 2018 17:38:25 +0100, Johannes Schmitz wrote:
> This patch is need for example for ci20, -mfused-madd is deprecated, we
> need to use -ffp-contract instead.
> 
> This is basically a resubmission of
> https://patchwork.ozlabs.org/patch/800406/
> 
> Please consider accepting the original patch, otherwise buildroot is
> basically broken for ci20 and similar platforms.

Is your patch a resubmission, or an additional patch ? You say it's a
resubmission, and then the next paragraph you say we should also apply
the original patch.

Also, the commit log should explain since which gcc version is
-mfused-madd deprecated, and since which gcc version is -ffp-contract
available.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
