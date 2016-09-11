From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:29:55 +0200
Subject: [Buildroot] [PATCH] board/minnowboard-max: Add kernel options
 to support USB disks
In-Reply-To: <20160901193258.10754-1-ezequiel@vanguardiasur.com.ar>
References: <20160901193258.10754-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160911232955.5c48f20e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Sep 2016 16:32:58 -0300, Ezequiel Garcia wrote:
> As reported by bug #9176 the current v4.6 kernel config
> (used by Minnowboard MAX and Turbot) does not support
> USB disks. Since this is a pretty essential functionality,
> it's desirable to have it, so let's add the required options.
> 
> Kernel config linux-v3.8.config (currently used by the first
> generation Minnowboard) doesn't need this change.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  board/minnowboard/linux-4.6.config | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
