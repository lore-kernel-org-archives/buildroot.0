From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:52:31 +0200
Subject: [Buildroot] [PATCH] libglib2: backport native linux GMutex
 implementation
In-Reply-To: <1405817117-5722-1-git-send-email-jcmvbkbc@gmail.com>
References: <1405817117-5722-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140720115231.10f13b3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sun, 20 Jul 2014 04:45:17 +0400, Max Filippov wrote:
> This fixes libglib2 build on architectures that don't support NPTL.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/a1a/a1a1f97a2c54ba4f7f7e44cc094a55bd23ca0aa0/
> 
> Backported from: 49b59e5ac4428a6a99a85d699c3662f96efc4e9d
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...2-0003-implement-GMutex-natively-on-Linux.patch |  279 ++++++++++++++++++++
>  1 files changed, 279 insertions(+), 0 deletions(-)
>  create mode 100644 package/libglib2/libglib2-0003-implement-GMutex-natively-on-Linux.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
