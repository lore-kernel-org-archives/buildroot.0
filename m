From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:16:00 +0200
Subject: [Buildroot] [PATCH 0/2] systemd: bump to version 215
In-Reply-To: <1406302301-9382-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1406302301-9382-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140726091600.6dc09661@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 25 Jul 2014 17:31:39 +0200, Eric Le Bihan wrote:

>  - a bump of the systemd package to version 215.
>  - a patch to disable the ldconfig.service unit, installed by v215 (this unit
>    would fail, as /sbin/ldconfig is not installed in a target generated using
>    a glibc-based toolchain).

Thanks, I've applied both patches. However, for the second one, I
consider it as a temporary solution. We should really fix the ldconfig
handling in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
