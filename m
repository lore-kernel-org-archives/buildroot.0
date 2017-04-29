From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 17:15:44 +0200
Subject: [Buildroot] [PATCH v2 01/25] package configs: clean up
 indentation warnings
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170429171544.3c285c4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:17:47 -0400, Adam Duskett wrote:
> The check-package script when ran gave warnings on indentation issues
> on all of these Config files.  This patch cleans up all warnings
> related to the indentation of the Config files in the package directory
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> v1 -> v2:
>   - No changes.
>   
>  package/b43-firmware/Config.in       |   8 +-
>  package/binutils/Config.in.host      |  12 +-
>  package/gcc/Config.in.host           | 156 +++++------
>  package/gdb/Config.in.host           |  12 +-
>  package/jquery-ui-themes/Config.in   |  96 +++----
>  package/kodi/Config.in               | 100 +++----

I've dropped the changes on this file.

>  package/linux-headers/Config.in.host |  85 +++---
>  package/lua/Config.in                |  12 +-
>  package/uclibc/Config.in             |  28 +-
>  package/x11r7/Config.in              | 526 ++++++++++++++++++-----------------

And the changes on this file. I'm not sure we want to apply the exact
same indentation rule for those files.

Applied after making those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
