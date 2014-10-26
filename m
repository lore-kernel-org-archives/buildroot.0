From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:08:36 +0100
Subject: [Buildroot] [PATCH] zlog: Add patch to remove -Werror
In-Reply-To: <1414352079-17708-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1414352079-17708-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20141026220836.43a36c88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Sun, 26 Oct 2014 16:34:39 -0300, Ezequiel Garcia wrote:
> Add patch to remove -Werror and avoid build errors because of warnings.
> 
> Fixes: http://autobuild.buildroot.net/results/6935e1107d832e5678c8742239eccd89d4abed47/
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> --
> Sent upstream: https://github.com/HardySimpson/zlog/pull/68
> ---
>  ...ove-Werror-and-avoid-build-failures-becau.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/zlog/zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
