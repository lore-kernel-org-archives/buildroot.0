From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:48:26 +0100
Subject: [Buildroot] [PATCH 1/1] coreutils: disable stdbuf for static
 builds
In-Reply-To: <1448745450-19283-1-git-send-email-0intro@gmail.com>
References: <1448745450-19283-1-git-send-email-0intro@gmail.com>
Message-ID: <20151217224826.62b06019@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David du Colombier,

On Sat, 28 Nov 2015 22:17:30 +0100, David du Colombier wrote:
> When stdbuf is enabled, it builds a shared library,
> but it will fail in a static-only scenario.
> 
> Signed-off-by: David du Colombier <0intro@gmail.com>
> ---
>  package/coreutils/coreutils.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks. I've added a reference to the autobuilder failure that
this patch is fixing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
