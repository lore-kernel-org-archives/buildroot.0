From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:06:54 +0200
Subject: [Buildroot] [PATCH 2/4] webkitgtk: Add patches which allow
 building for ARMv8-A
In-Reply-To: <20170712235531.20444-3-aperez@igalia.com>
References: <20170712235531.20444-1-aperez@igalia.com>
 <20170712235531.20444-3-aperez@igalia.com>
Message-ID: <20170721090654.5eb8e26b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 02:55:29 +0300, Adrian Perez de Castro wrote:
> The two added patches allow building WebKitGTK+ when the compiler
> scpecifically targets ARMv8-A, and reports as such be pre-defining
> __ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
> pulled from the corresponding upstream bug reports and edited to
> remove the conflicting parts which edit the ChangeLog files.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...ailure-to-build-when-the-compiler-specifica.patch | 20 ++++++++++++++++++++
>  ...re-to-build-when-the-compiler-specifically-.patch | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
>  create mode 100644 package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch

Since the webkitgtk project is maintained upstream under Git, can we
get Git formatted patches instead? Please use "git format-patch -N" to
generate them, as we don't want patch numbering inside the patches,
only in the filenames.

This is obviously also valid for PATCH 3/4 in your series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
