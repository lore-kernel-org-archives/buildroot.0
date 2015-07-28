From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:11:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix compilation issue
 on SPARC
In-Reply-To: <1438101602-19760-1-git-send-email-brendanheading@gmail.com>
References: <1438101602-19760-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150728231146.7453e9ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Tue, 28 Jul 2015 17:40:02 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/b3c/b3cb6515496cf09d305a1077d01f87d75ece8a8d/
> 
> Patch added to improve detection of atomic support in the compiler.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  .../0001-fix-compile-time-atomic-detection.patch   | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/libglib2/0001-fix-compile-time-atomic-detection.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
