From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:25:25 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libglib2: remove bindir prefix from gio-2.0.pc
In-Reply-To: <20190613191755.18349-1-fontaine.fabrice@gmail.com>
References: <20190613191755.18349-1-fontaine.fabrice@gmail.com>
Message-ID: <20190617212525.4b7446bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Jun 2019 21:17:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Apply LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE to gio-2.0.pc so
> ${bindir} prefix is also removed for gbus-codegen otherwise build of
> packages using this binary will fail if gbus-codegen is not installed on
> host
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5c0e4f3d33e01198688d58388aabe159bd005234
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin and Carlos Santos):
>  - Drop shell loop and use addprefix

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
