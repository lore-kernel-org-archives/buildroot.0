From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:30:54 +0100
Subject: [Buildroot] [PATCH] lirc-tools: needs host-python3
In-Reply-To: <1458391485-23315-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458391485-23315-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320153054.5fc918e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 09:44:45 -0300, Gustavo Zacarias wrote:
> As stated in NEWS "Build scripts now requires python3". Fixes:
> http://autobuild.buildroot.net/results/f41/f417a17ad24eec8f72402a634588c6b3af8293be/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/lirc-tools/lirc-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. However, one question that comes to mind is
what will happen if both host-python and host-python3 are built, will
lirc-tools build system properly use python3 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
