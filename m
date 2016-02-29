From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:40:45 +0100
Subject: [Buildroot] [PATCH 01/32] package/lz4: bump version to r131
In-Reply-To: <1456437341-19025-2-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-2-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160229224045.602c0487@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Thu, 25 Feb 2016 21:55:10 +0000, Gabe Evans wrote:
> systemd v228 requires lz4 >= 125
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/lz4/lz4.hash |  2 ++
>  package/lz4/lz4.mk   | 19 ++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>  create mode 100644 package/lz4/lz4.hash

Applied to next with the following change:

    [Thomas: only pass PREFIX=/usr at install time instead of using
    LZ4_MAKE_OPTS, and also pass it for the host installation.]

As was suggested by Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
