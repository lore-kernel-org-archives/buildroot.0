From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:55:45 +0100
Subject: [Buildroot] [Patch v3 9/9] s6-linux-init: new package
In-Reply-To: <1482182955-23916-10-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-10-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170310225545.0c091e09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:15 +0100, Eric Le Bihan wrote:
> This new package provides s6-linux-init, a set of minimalistic tools to
> create a s6-based init system, including a /sbin/init program, on a
> machine running a Linux kernel.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                        |  1 +
>  package/s6-linux-init/Config.in          | 11 ++++++++++
>  package/s6-linux-init/s6-linux-init.hash |  2 ++
>  package/s6-linux-init/s6-linux-init.mk   | 36 ++++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 package/s6-linux-init/Config.in
>  create mode 100644 package/s6-linux-init/s6-linux-init.hash
>  create mode 100644 package/s6-linux-init/s6-linux-init.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
