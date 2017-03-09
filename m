From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:33:12 +0100
Subject: [Buildroot] [Patch v3 6/9] s6-rc: new package
In-Reply-To: <1482182955-23916-7-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-7-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170309233312.2c10dee9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:12 +0100, Eric Le Bihan wrote:
> This new package provides s6-rc, a service manager for s6-based systems,
> i.e. a suite of programs that can start and stop services, both
> long-running daemons and one-time initialization scripts, in the proper
> order according to a dependency tree.
> 
> The host variant is provided so s6-rc-compile is available and can
> be used to build the services database offline, either in a package
> Makefile or a post-build script.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in        |  1 +
>  package/s6-rc/Config.in  | 11 ++++++++
>  package/s6-rc/s6-rc.hash |  2 ++
>  package/s6-rc/s6-rc.mk   | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 87 insertions(+)
>  create mode 100644 package/s6-rc/Config.in
>  create mode 100644 package/s6-rc/s6-rc.hash
>  create mode 100644 package/s6-rc/s6-rc.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
