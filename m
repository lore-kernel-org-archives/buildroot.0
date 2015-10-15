From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:40:34 +0200
Subject: [Buildroot] [PATCH] busybox: enable fully featured hush shell
 for nommu
In-Reply-To: <1444862205-23935-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444862205-23935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151015094034.31b75c6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Oct 2015 19:36:45 -0300, Gustavo Zacarias wrote:
> As pointed by Rich Fekler on IRC the basic hush shell is pretty much
> useless since it doesn't support if conditionals, loops, functions, case
> or even interactive mode.
> So enable the full feature-set.
> Size delta: +10184 bytes uncompressed for blackfin fdpic.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/busybox.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
