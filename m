From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:42:36 +0100
Subject: [Buildroot] [PATCH] uemacs: remove XCASE flag to allow musl
 builds
In-Reply-To: <20151128221553.GA15986@vostro>
References: <20151128221553.GA15986@vostro>
Message-ID: <20151129144236.7ec59e38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sun, 29 Nov 2015 00:15:53 +0200, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/e92/e929de08954684e275a2f682264551b6cb07886a/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/uemacs/02-skip-xcase-termios-flag.patch | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 package/uemacs/02-skip-xcase-termios-flag.patch

Applied, thanks. Could you send this patch (and the other existing
patch) to the upstream project?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
