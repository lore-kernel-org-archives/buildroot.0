From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:19:39 +0100
Subject: [Buildroot] [v2,
 1/1] systemd: enable selinux if libselinux is selected.
In-Reply-To: <MWHPR19MB14405FD5F80097332112D99DB99F0@MWHPR19MB1440.namprd19.prod.outlook.com>
References: <MWHPR19MB14405FD5F80097332112D99DB99F0@MWHPR19MB1440.namprd19.prod.outlook.com>
Message-ID: <20161217141939.7a87c3e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Dec 2016 05:29:42 +0000, Adam Duskett wrote:
> systemd currently has selinux disabled statically.  This prevents
> /sys/fs/selinux from being mounted automatically at boot which
> causes audit to no longer function.  This patch fixes the problem
> by checking to see if libselinux is selected and enabling support for
> selinux if so.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 - v2:
>  - Added SYSTEMD_DEPENDENCIES += libselinux in the case that
>    libselinux was selected.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
