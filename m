From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 20:22:30 +0100
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.4
In-Reply-To: <1363709561-4091-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Tue, 19 Mar 2013 17:12:41 +0100")
References: <1363709561-4091-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87zjxztcsp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Version 2.0.4 has improved support for handling of device-tree
 Sven> blobs on the ARM platform.

Committed, thanks.

 Sven> -KEXEC_VERSION = 2.0.3
 Sven> -KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
 Sven> +
 Sven> +KEXEC_VERSION = 2.0.4
 Sven> +KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 Sven>  KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec

It would be nice if you could also send a patch adding _LICENSE /
_LICENSE_FILES tags for kexec.

-- 
Bye, Peter Korsgaard
