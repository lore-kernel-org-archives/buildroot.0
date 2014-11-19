From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:20:58 +0100
Subject: [Buildroot] [PATCH 8/9] dhcpcd: use standard installation
In-Reply-To: <1416330117-4458-9-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141119232058.09946956@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 18 Nov 2014 14:01:56 -0300, Gustavo Zacarias wrote:
> Drop the custom/manual install cmds and do a normal make install.
> This gets dhcpcd-hooks installed which are useful for many accesory
> setup functions like dns, ntp server, and so on.
> Also install dhcpcd to /sbin since it's expected by debian ifupdown,
> For busybox ifupdown when external dhcp clients are enabled (not in the
> default config we ship) will search the path.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dhcpcd/dhcpcd.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
