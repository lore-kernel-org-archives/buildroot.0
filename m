From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 23:24:13 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8
In-Reply-To: <20170705190840.22469-2-aperez@igalia.com>
References: <20170705190840.22469-1-aperez@igalia.com>
 <20170705190840.22469-2-aperez@igalia.com>
Message-ID: <20170706232413.526b130d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 22:08:40 +0300, Adrian Perez de Castro wrote:
> This is needed for correctly building some CMake-based packages which
> use this variable. For example, this is needed for WebKitGTK+ 2.16.x
> to build correctly when an ARMv8 target is configured.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/pkg-cmake.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

It is worth mentioning that sending a cover letter for a one patch
patch series isn't really necessary. If you want to put additional
information besides the commit log, you can put them after the "---"
separator below the SoB line.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
