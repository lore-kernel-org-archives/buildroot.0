From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 12:28:27 +0200
Subject: [Buildroot] [PATCH v2] uclibc-ng: fix parallel build issue for
 arm/xtensa when LOCALE support is enabled
In-Reply-To: <20150630043336.GA7128@waldemar-brodkorb.de>
References: <20150630043336.GA7128@waldemar-brodkorb.de>
Message-ID: <20150630122827.2777589d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 30 Jun 2015 06:33:36 +0200, Waldemar Brodkorb wrote:
> This patch should fix any parallel build issues found
> by autobuilder lately, f.e.:
> http://autobuild.buildroot.net/results/43dd5c5da0d003b654fd252c989d49c2e5872827/
> http://autobuild.buildroot.net/results/cfb438f933ff7385d612d65798b0b8ed833a6476/
> and many more.
> Will be committed upstream, if autobuilders are working.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/1.0.3/0002-fix-parallel-build.patch |   21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/uclibc/1.0.3/0002-fix-parallel-build.patch

Applied, thanks. We'll see if that fixes the issue. Thanks for having
worked on this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
