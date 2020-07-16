From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 22:28:33 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/lxc: fix license
In-Reply-To: <20200716185345.1016519-1-fontaine.fabrice@gmail.com>
References: <20200716185345.1016519-1-fontaine.fabrice@gmail.com>
Message-ID: <20200716222833.6e454992@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 20:53:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5a393677314dfdaa6a4bd6a847b642ae54517538 forgot to update
> license which has been changed from COPYING to LICENSE.GPL2 and
> LICENSE.LGPL2.1 since version 4.0.0 and
> https://github.com/lxc/lxc/commit/cc73685dd09315b292968ee91a08a8f295376b35
> 
> It should be noted that COPYING describes GPLv3, see upstream answer
> here: https://github.com/lxc/lxc/issues/3484
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2da182d0b84e2597e135506f8166a54660c4b2f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Specify that GPL-2.0 is for some tools (6 source files)
>  - Add link on upstream answer for COPYING

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
