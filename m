From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 22:52:41 +0200
Subject: [Buildroot] [PATCH 1/1] lttng-libust: Disable liblttng-ust-dl
 with uClibc.
In-Reply-To: <1396181930-21038-1-git-send-email-romain.naour@openwide.fr>
References: <1396181930-21038-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140406225241.251e4126@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 30 Mar 2014 14:18:50 +0200, Romain Naour wrote:
> According to uClibc commit [1], dlinfo is not available.
> To be able to use LTTng UST with uClibc, we need to disable
> the Dynamic Linker Tracing functionality [2].
> 
> Fixes:
> http://autobuild.buildroot.net/results/a6c/a6c33dd7ec2a36a50c5ea74b989a371d6c85e899/build-end.log
> 
> [1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
> [2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...iblttng-ust-dl-if-dlinfo-is-not-available.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
