From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:21:10 +0100
Subject: [Buildroot] [PATCH 9/9] network-manager: adjust dhclient and
 dhcpcd directories
In-Reply-To: <1416330117-4458-10-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141119232110.115c9cc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 18 Nov 2014 14:01:57 -0300, Gustavo Zacarias wrote:
> dhclient and dhcpcd were moved from /usr/sbin to /sbin for busybox-less
> SysV-style init with Debian utilities, so adjust accordingly.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/network-manager/network-manager.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
