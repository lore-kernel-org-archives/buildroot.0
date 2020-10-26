From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:06:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: bump to version 9.15
In-Reply-To: <20201025155429.1536514-1-fontaine.fabrice@gmail.com>
References: <20201025155429.1536514-1-fontaine.fabrice@gmail.com>
Message-ID: <20201026220652.01e69ebb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 16:54:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/LINBIT/drbd-utils/blob/v9.15.0/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-setup_options-definitions-as-extern.patch | 31 -------------------
>  package/drbd-utils/drbd-utils.hash            |  2 +-
>  package/drbd-utils/drbd-utils.mk              |  2 +-
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
