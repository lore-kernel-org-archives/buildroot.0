From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:57:32 +0100
Subject: [Buildroot] [PATCH 5/9] dhcp: install dhclient to /sbin
In-Reply-To: <1416330117-4458-6-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141118235732.4b94176c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 18 Nov 2014 14:01:53 -0300, Gustavo Zacarias wrote:
> Debian ifupdown uses an explicit call to /sbin/dhclient.
> Busybox ifupdown uses the search path.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dhcp/dhcp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
