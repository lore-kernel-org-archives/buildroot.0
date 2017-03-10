From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:53:28 +0100
Subject: [Buildroot] [Patch v3 8/9] s6-linux-utils: new package
In-Reply-To: <1482182955-23916-9-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-9-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170310225328.06ee4e7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:14 +0100, Eric Le Bihan wrote:
> This new package provides s6-linux-utils, a set of minimalistic
> Linux-specific system utilities.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                          |  1 +
>  package/s6-linux-utils/Config.in           |  9 ++++++++
>  package/s6-linux-utils/s6-linux-utils.hash |  2 ++
>  package/s6-linux-utils/s6-linux-utils.mk   | 34 ++++++++++++++++++++++++++++++
>  4 files changed, 46 insertions(+)
>  create mode 100644 package/s6-linux-utils/Config.in
>  create mode 100644 package/s6-linux-utils/s6-linux-utils.hash
>  create mode 100644 package/s6-linux-utils/s6-linux-utils.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
