From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 19:14:38 +0200
Subject: [Buildroot] [PATCH] syslinux: fix boot hang when host-gcc is 5.3
In-Reply-To: <1462118287-5017-1-git-send-email-fhunleth@troodon-software.com>
References: <1462118287-5017-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160501191438.64efbf4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 11:58:07 -0400, Frank Hunleth wrote:
> Syslinux uses the host version of gcc to build to bootloader. On systems
> with gcc 5.3, this results in a bootloader that hangs. This issue has
> been addressed in upstream syslinux, but an official release has not
> been made yet. This commit adds the upstream patch to fix the issue.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks! Do you think this could fix bug
https://bugs.busybox.net/show_bug.cgi?id=8866 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
