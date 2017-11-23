From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:40:46 +0100
Subject: [Buildroot] [PATCH v4 1/3] uboot: Use BR2_TARGET_UBOOT_SPL_NAME
 for TPL name
In-Reply-To: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
References: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171123224046.714ce9f6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Nov 2017 10:28:47 +0100, Jagan Teki wrote:
> Since BR2_TARGET_UBOOT_SPL_NAME can accept list of binaries,
> the same config can reuse for TPL binary name as well.
> So update the string and help text to indicate the same
> config use for SPL and TPL.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4:
> - Use BR2_TARGET_UBOOT_SPL_NAME for adding tpl binary
> Changes for v3, v2:
> - None

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
