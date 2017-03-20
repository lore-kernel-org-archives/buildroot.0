From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:26:56 +0100
Subject: [Buildroot] [PATCH v4 1/2] arch: add BR2_READELF_ARCH_NAME
 hidden config option
In-Reply-To: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170320222656.38163a70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 14:07:51 +0100, Thomas Petazzoni wrote:
> This config option corresponds to the string returned by readelf for
> the "Machine" field of the ELF header. It will be used to check if the
> architecture of binaries built by Buildroot match the target
> architecture.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v3:
>  - None

I've applied both patches to master. Let's see if the autobuilders blow
up now :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
