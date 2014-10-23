From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 22:13:15 +0200
Subject: [Buildroot] [PATCH] tftpd: Install TFTP client as well
In-Reply-To: <1414062804-11701-1-git-send-email-keguang.zhang@gmail.com>
References: <1414062804-11701-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <20141023221315.2d4f658a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kelvin Cheung,

On Thu, 23 Oct 2014 19:13:24 +0800, Kelvin Cheung wrote:
> This patch installs TFTP client as well and overrides
> BusyBox implementations if BusyBox is enabled.
> 
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
>  package/tftpd/tftpd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks, applied, after fixing the SYSKLOGD typo noticed by Baruch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
