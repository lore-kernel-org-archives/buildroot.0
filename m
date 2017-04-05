From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 22:30:24 +0200
Subject: [Buildroot] [PATCH v2] Add out-of-source U-Boot device tree
 support
In-Reply-To: <1491363951-3971-1-git-send-email-james@balean.com.au>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
 <1490681640-14995-1-git-send-email-james@balean.com.au>
 <54cae0a0-a7a5-9ef0-08c8-a14e871cf8bb@mind.be>
 <20170328215334.405952d9@free-electrons.com>
 <1d453613-dc32-9ab1-229b-2deed767a12f@mind.be>
 <20170328222929.036d1152@free-electrons.com>
 <92078ad6-2fcc-69e4-86b9-0d296ef350c0@mind.be>
 <20170329090909.4c74c734@free-electrons.com>
 <1491362990-3697-1-git-send-email-james@balean.com.au>
 <1491363951-3971-1-git-send-email-james@balean.com.au>
Message-ID: <20170405223024.1d43de2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 22:45:51 -0500, James Balean wrote:
> Similaly to Linux, this patch adds the ability to copy in and build
> out-of-source device tree sources during a U-Boot build.
> 
> Signed-off-by: James Balean <james@balean.com.au>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes for v2:
>   - Added dependency on U-Boot Kconfig build system.
>   - Code style cleanup

Applied to master after slightly tweaking the help text and dropping a
needlessly added newline at the end of Config.in.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
