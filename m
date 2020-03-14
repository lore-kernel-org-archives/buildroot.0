From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:11:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-ares: bump to version 1.16.0
In-Reply-To: <20200313210449.1152680-1-fontaine.fabrice@gmail.com>
References: <20200313210449.1152680-1-fontaine.fabrice@gmail.com>
Message-ID: <20200314151159.001e17af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Mar 2020 22:04:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-use_check_build_instead_of_check_user.patch | 17 -----------------
>  package/c-ares/c-ares.hash                      |  4 ++--
>  package/c-ares/c-ares.mk                        |  4 +---
>  3 files changed, 3 insertions(+), 22 deletions(-)
>  delete mode 100644 package/c-ares/0001-use_check_build_instead_of_check_user.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
