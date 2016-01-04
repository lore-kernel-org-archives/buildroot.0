From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jan 2016 19:31:51 +0100
Subject: [Buildroot] [PATCH] strace: enable supported nios2 arch
In-Reply-To: <1451931258-30051-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1451931258-30051-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160104193151.4161bf78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jan 2016 15:14:18 -0300, Ezequiel Garcia wrote:
> Support for Nios-II has been added in strace release 4.11.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  package/strace/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (built tested with Buildroot glibc toolchain on NIOS 2)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
