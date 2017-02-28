From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 23:40:37 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: fix build for toolchains without
 ssp
In-Reply-To: <1488320767-63856-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1488320767-63856-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170228234037.12107729@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 23:26:07 +0100, Fabrice Fontaine wrote:
> Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF to disable custom flags, in
> particular -fstack-protector-strong which depends on
> BR2_TOOLCHAIN_HAS_SSP
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Is this necessary for the 1.3.2 bump to work fine, or is it a separate
build fix that applies to the version of cjson currently packaged in
Buildroot?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
