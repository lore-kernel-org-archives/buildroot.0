From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:00:02 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: update to latest,
 fix uClibc-ng issues
In-Reply-To: <20160305103953.GA13280@waldemar-brodkorb.de>
References: <20160305103953.GA13280@waldemar-brodkorb.de>
Message-ID: <20160305150002.374736ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 5 Mar 2016 11:39:54 +0100, Waldemar Brodkorb wrote:
> Update to latest ltp-testsuite release, which resolves sparc64/sparc
> autobuild failures:
> http://autobuild.buildroot.net/results/a6445df26514dfa9cd7e5b9d34b4687d46a8d19b/
> 
> Furthermore it should fix any other uClibc-ng related issues.
> 0001-fix-build-on-uClibc-exp10.patch removed, as uClibc-ng 1.0.12
> contains exp10() implementation.
> 0001-fix-uClibc-build.patch suggested upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> The other patches will be suggested upstream after review from
> buildroot community or any autobuilder failure free time for this
> package. I tested for Qemu-MIPS, Qemu-SH, Qemu-SPARC, Qemu-SPARC64.

Applied to master, thanks!

Indeed, please submit your patches upstream. Also, next time, when the
project is hosted on a Git repository upstream, we really, really
prefer to have Git formatted patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
