From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 09:57:28 +0200
Subject: [Buildroot] [PATCH v1] binutils-2.27: backport patch to enable
 CRC instructions on supported ARMv8-A CPUs
In-Reply-To: <20170715231146.25019-1-ps.report@gmx.net>
References: <20170715231146.25019-1-ps.report@gmx.net>
Message-ID: <20170716095728.3df46596@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 01:11:45 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ly-enable-CRC-instructions-on-supported-A.patch | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch

Thanks, I've applied both patches, but please don't forget the binutils
2.26 case (a follow-up patch can be sent if needed).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
