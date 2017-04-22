From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:56:39 +0200
Subject: [Buildroot] [PATCH 2/7] package configs: clean up ordering.
In-Reply-To: <20170421152452.11236-2-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
 <20170421152452.11236-2-aduskett@codeblue.com>
Message-ID: <20170422155639.09402617@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 11:24:47 -0400, Adam Duskett wrote:
> The check-package script when ran gives warnings on ordering issues
> on all of these Config files.  This patch cleans up all warnings
> related to the ordering in the Config files in the package directory.
> 
> The appropriate ordering is: type, default, depends on, select, help
> See http://nightly.buildroot.org/#_config_files for more information.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

This is really too long/too boring to review. I believe this should
rather be done progressively, or split into smaller patches. One patch
per package is quite certainly too much. Maybe one patch for packages
starting with "a", one for packages starting with "b", etc.

But don't send the whole thing at once. We don't want to have the
patchwork backlog flooded by cleanup patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
