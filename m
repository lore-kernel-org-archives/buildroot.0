From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:26:11 +0100
Subject: [Buildroot] [PATCH] pppd: set resolv.conf directory appropiately
In-Reply-To: <1413840752-16362-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413840752-16362-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141029232611.5c130a96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 18:32:32 -0300, Gustavo Zacarias wrote:
> /etc/ppp/resolv.conf might not be writable and it's not useful, switch
> to standard /etc/resolv.conf
> If users don't want to update dns lookup entries they shouldn't use the
> "userpeerdns" option.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pppd/pppd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks, applied, after slightly rewording the comment in the code.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
