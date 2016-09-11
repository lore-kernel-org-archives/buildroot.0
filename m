From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:27:29 +0200
Subject: [Buildroot] [PATCH 1/1] jemalloc: add a check for valgrind
 being configured as well
In-Reply-To: <1473378120-7549-1-git-send-email-ckhardin@exablox.com>
References: <1473378120-7549-1-git-send-email-ckhardin@exablox.com>
Message-ID: <20160911222729.36d49c29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 16:42:00 -0700, Charles Hardin wrote:
> jemalloc can be compiled with valgrind support being enabled
> to produce proper output, so when the valgrind package has
> been configured configure jemalloc appropriately.
> 
> Signed-off-by: Charles Hardin <ckhardin@exablox.com>
> ---
>  package/jemalloc/jemalloc.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
