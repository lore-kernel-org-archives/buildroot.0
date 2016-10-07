From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 23:18:19 +0200
Subject: [Buildroot] [PATCH 1/4] atop: new package
In-Reply-To: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
References: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161007231819.70b6484f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 17:30:28 -0300, Ricardo Martincoski wrote:
> Atop is an ASCII full-screen performance monitor for Linux.
> 
> - install only the basic functionality (command line tool atop).
> 
> - add patch to fix musl build by removing unused include of termio.h.
>   Patch was accepted upstream.
> 
> Support for extra functionality can be added by follow-up patches:
> - init scripts (sysv and systemd) to autostart logging the system
>   activity.
> - process accounting (needs counterpart enabled in the kernel).
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-remove-unused-include-of-termio.h.patch   | 52 ++++++++++++++++++++++
>  package/atop/Config.in                             | 18 ++++++++
>  package/atop/atop.hash                             |  2 +
>  package/atop/atop.mk                               | 21 +++++++++
>  5 files changed, 94 insertions(+)
>  create mode 100644 package/atop/0001-remove-unused-include-of-termio.h.patch
>  create mode 100644 package/atop/Config.in
>  create mode 100644 package/atop/atop.hash
>  create mode 100644 package/atop/atop.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
