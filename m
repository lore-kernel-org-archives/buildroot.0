From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:56:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] ltp-testsuite: Add upstream patch to
 fix build numa detection
In-Reply-To: <20180130212349.15083-1-petr.vorel@gmail.com>
References: <20180130212349.15083-1-petr.vorel@gmail.com>
Message-ID: <20180130225648.7468b0bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Jan 2018 22:23:49 +0100, Petr Vorel wrote:
> This removes fix added in commit 3c937807a3 ("ltp-testsuite: disable numa tests")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1-v2:
> * Add LTP_TESTSUITE_AUTORECONF = YES to really regenerate configure.
> ---
>  ...x-numa-v2-detection-for-cross-compilation.patch | 37 ++++++++++++++++++++++
>  package/ltp-testsuite/ltp-testsuite.mk             |  6 ++--
>  2 files changed, 41 insertions(+), 2 deletions(-)
>  create mode 100644 package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
