From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:38:15 +0200
Subject: [Buildroot] [PATCH] uclibc: fix static linking of pthread apps
 for x86/x86_64
In-Reply-To: <20150722161325.GA7861@waldemar-brodkorb.de>
References: <20150722161325.GA7861@waldemar-brodkorb.de>
Message-ID: <20150722223815.32b4d015@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 22 Jul 2015 18:13:26 +0200, Waldemar Brodkorb wrote:
> Fixes:
> http://autobuild.buildroot.net/results/182424bd2fea36af95eea31f7dd53f0399433616/
> http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../uclibc/1.0.4/0001-fix-static-linking-bug.patch |   64 ++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/uclibc/1.0.4/0001-fix-static-linking-bug.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
