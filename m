From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:05:09 +0200
Subject: [Buildroot] [PATCH 1/4] webkitgtk: Remove patch uneeded for the
 current version
In-Reply-To: <20170712235531.20444-2-aperez@igalia.com>
References: <20170712235531.20444-1-aperez@igalia.com>
 <20170712235531.20444-2-aperez@igalia.com>
Message-ID: <20170721090509.7093f3d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 02:55:28 +0300, Adrian Perez de Castro wrote:
> Version 2.16.5 of WebKitGTK+ already includes the fix added by the
> removed patch, which is now unneeded.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/0001-fix-gcc6-builds.patch | 53 ----------------------------
>  1 file changed, 53 deletions(-)
>  delete mode 100644 package/webkitgtk/0001-fix-gcc6-builds.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
