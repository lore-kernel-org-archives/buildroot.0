From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 15:58:36 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: make LOGIN_FAIL_DELAY
 configurable
In-Reply-To: <1419085332-379-1-git-send-email-syntheticpp@gmx.net>
References: <1419085332-379-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20141220155836.7ae8c639@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

On Sat, 20 Dec 2014 15:22:12 +0100, Peter K?mmel wrote:
> Pass LOGIN_FAIL_DELAY=<seconds> in busybox's CONFIG_EXTRA_CFLAGS
> to change default delay of 3 seconds.
> 
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  .../busybox/busybox-0007-login-fail-delay.patch    | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/busybox/busybox-0007-login-fail-delay.patch

Even though the patch is small, it is in a way a "feature" patch: do
something that the upstream Busybox doesn't allow to do. Could you
instead submit this patch upstream, and once it gets accepted, backport
it into Buildroot?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
