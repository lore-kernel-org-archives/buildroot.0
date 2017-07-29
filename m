From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:37:33 +0200
Subject: [Buildroot] [PATCH v3 1/1] webkitgtk: Add patches which allow
 building for ARMv8-A
In-Reply-To: <20170729131639.28156-1-aperez@igalia.com>
References: <20170729131639.28156-1-aperez@igalia.com>
Message-ID: <20170729153733.4c2f53e6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 16:16:39 +0300, Adrian Perez de Castro wrote:
> The two added patches allow building WebKitGTK+ when the compiler
> scpecifically targets ARMv8-A, and reports as such be pre-defining
> __ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
> pulled from the corresponding upstream bug reports and edited to
> remove the conflicting parts which edit the ChangeLog files.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> ---
> Changes v2 -> v3:
>     - Remove hunks for ChangeLog edits, which are not present in releases.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
