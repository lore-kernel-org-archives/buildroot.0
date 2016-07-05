From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 19:15:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] acpica: new package
In-Reply-To: <20160703104535.10401-1-nunes.erico@gmail.com>
References: <20160703104535.10401-1-nunes.erico@gmail.com>
Message-ID: <20160705191512.1109aa83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 12:45:35 +0200, Erico Nunes wrote:
> The ACPI Component Architecture (ACPICA) project provides an operating
> system (OS)-independent reference implementation of the Advanced
> Configuration and Power Interface Specification (ACPI).
> 
> It contains tools such as acpidump, iasl, acpixtract, etc.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---

This package fails to build on MIPS64:

   http://autobuild.buildroot.net/results/d7a/d7adbd07c5e74f0305ac03fab615290dfa20e9b5/build-end.log

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
