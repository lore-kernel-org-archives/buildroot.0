From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Mar 2019 22:19:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/czmq: remove uneeded werror
 patch
In-Reply-To: <20190311173258.2334-1-fontaine.fabrice@gmail.com>
References: <20190311173258.2334-1-fontaine.fabrice@gmail.com>
Message-ID: <20190311221950.4e09f410@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Mar 2019 18:32:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch and use --disable-Werror to disable -Werror
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/czmq/0001-configure.ac-remove-Werror.patch | 32 ----------------------
>  package/czmq/czmq.mk                               |  4 +--
>  2 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/czmq/0001-configure.ac-remove-Werror.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
