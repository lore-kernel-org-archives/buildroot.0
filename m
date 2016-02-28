From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:33:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-argustv: Fix compile
 error with gcc5
In-Reply-To: <1456617961-16262-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456617961-16262-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160228223347.0dd092d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Feb 2016 01:06:00 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/dac/dacc3bd00ab2346d7655c0a1fb99f6c50b9da08b/
> http://autobuild.buildroot.net/results/a6d/a6d3b510681f54f5625908930b4da73bf9edccf7/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...epresentation-of-char_class_e-in-struct-t.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/kodi-pvr-argustv/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
