From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:16:04 +0100
Subject: [Buildroot] [PATCH] toolchain/external: do not accept
 distro-class toolchains
In-Reply-To: <54C7FF64.3030501@mind.be>
References: <1422225691-15930-1-git-send-email-yann.morin.1998@free.fr>
 <54C7FF64.3030501@mind.be>
Message-ID: <20150127221604.134cffdb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 27 Jan 2015 22:13:08 +0100, Arnout Vandecappelle wrote:

>  This sounds as if the problem is that the binary can't be moved to a different
> place. But for pre-installed external toolchains, we don't do that.
> 
>  But I guess the real problem is that we can't copy the libs to the staging dir,
> right? So perhaps that should be written in this remark.

Yes the problem is more that such toolchains typically don't have a
clean sysroot, with just the C library, C library headers and kernel
headers.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
