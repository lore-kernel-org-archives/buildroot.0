From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:00:03 +0200
Subject: [Buildroot] [PATCH] libcofi: disable for static-only builds
In-Reply-To: <1470558003-19548-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470558003-19548-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807230003.37eecd49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 10:20:03 +0200, Thomas Petazzoni wrote:
> The libcofi package unconditionally builds a shared library, so we need
> to make it unavailable on BR2_STATIC_LIBS=y configurations.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/329c09bf123cd5b6dbcfff6251ba7a2c7cce50b8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libcofi/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
