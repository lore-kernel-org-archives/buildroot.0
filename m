From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 16:31:15 +0200
Subject: [Buildroot] [PATCH 1/1] ulogd: fix build with musl
In-Reply-To: <1471403463-15864-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471403463-15864-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160818163115.2dc2581a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 08:41:03 +0530, Rahul Bedarkar wrote:
> Add upstream patches to fix build issue with musl.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c42/c42db6f8c89df87e9b55d6c7aaf6098d64d8ffdb/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...ev-null-as-dummy-logfile-when-logging-to-.patch |  70 ++
>  ...fine-_GNU_SOURCE-to-get-members-of-tcphdr.patch |  44 ++
>  .../ulogd/0003-Use-stdint-types-everywhere.patch   | 792 +++++++++++++++++++++
>  3 files changed, 906 insertions(+)
>  create mode 100644 package/ulogd/0001-ulogd-Use-dev-null-as-dummy-logfile-when-logging-to-.patch
>  create mode 100644 package/ulogd/0002-Define-_GNU_SOURCE-to-get-members-of-tcphdr.patch
>  create mode 100644 package/ulogd/0003-Use-stdint-types-everywhere.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
