From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 11:49:43 +0200
Subject: [Buildroot] [PATCH] hostapd: Install default hostapd.conf on
 target
In-Reply-To: <1467871946-14568-1-git-send-email-abrodkin@synopsys.com>
References: <1467871946-14568-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160707114943.166a45cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 09:12:26 +0300, Alexey Brodkin wrote:
> For convenience it's nice to have default hostapd.conf installed
> on target automatically as a good starting point.
> 
> Otherwise user has to create it manually from scratch.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>i
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/hostapd/hostapd.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
