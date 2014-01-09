From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:23:47 +0800
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
 version
In-Reply-To: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140110072347.40221f62@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 9 Jan 2014 17:07:45 +0000, Vicente Olivert Riera wrote:

> -config BR2_PACKAGE_LIBNFC_LLCP
> -	bool "libnfc-llcp"
> +config BR2_PACKAGE_LIBLLCP
> +	bool "libllcp"

You're renaming an option which I believe was part of a Buildroot
release, so please add the necessary Config.in.legacy stuff to ensure
that users upgrading are notified of this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
