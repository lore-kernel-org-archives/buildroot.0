From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:33:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-nextpvr: Fix compile
 error with gcc5
In-Reply-To: <1456618525-19280-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456618525-19280-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160228223352.20324e20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Feb 2016 01:15:25 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/eea/eea7be8691bad11546fbc9b8d3f1c0528ffd2619/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...epresentation-of-char_class_e-in-struct-t.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
