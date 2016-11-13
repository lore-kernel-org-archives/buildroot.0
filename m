From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:55:28 +0100
Subject: [Buildroot] [PATCH] tinymembench: add patch to fix build on
 Cortex-M
In-Reply-To: <1478898544-10711-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478898544-10711-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161113125528.6bcb1379@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 22:09:04 +0100, Thomas Petazzoni wrote:
> This commit adds a patch to the tinymembench package that fixes the
> build on Thumb-only architectures such as ARM Cortex-M. The patch has
> been submitted upstream in
> https://github.com/ssvb/tinymembench/pull/13.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5f0148cef22b3b9aee691e1702722a0bbc68c8e8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...arm-fix-build-on-Thumb-only-architectures.patch | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
