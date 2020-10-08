From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:48:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/nut: use pkg-config to find gd
In-Reply-To: <20201007202443.2998-1-fontaine.fabrice@gmail.com>
References: <20201007202443.2998-1-fontaine.fabrice@gmail.com>
Message-ID: <20201008214836.69304fde@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Oct 2020 22:24:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop gdlib-config and use pkg-config to find gd because gdlib-config
> has been dropped from version 2.3.0
> 
> gdlib.pc is available since version 2.1.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...m4-try-to-find-gd-through-pkg-config.patch | 120 ++++++++++++++++++
>  package/nut/nut.mk                            |   4 +-
>  2 files changed, 121 insertions(+), 3 deletions(-)
>  create mode 100644 package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
