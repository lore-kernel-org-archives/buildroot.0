From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:34:32 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: use binutils 2.24 by default
 on the target
In-Reply-To: <1436619173-17434-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436619173-17434-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150713173432.33b63f12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sat, 11 Jul 2015 14:52:52 +0200, Thomas Petazzoni wrote:
> When binutils is not built for the host, binutils.mk decides of the
> version to be used when building binutils for the target. We're still
> using the old 2.22 binutils version, but it's time to bump up to 2.24,
> which we already use as the default version for the host.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/binutils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks to Gustavo's Acked-by, I've applied both binutils patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
