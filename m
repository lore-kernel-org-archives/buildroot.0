From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 19:16:39 +0100
Subject: [Buildroot] [PATCH] system/skeleton: drop pcmcia bits
In-Reply-To: <1414519354-24108-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414519354-24108-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141028191639.364e3b5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Oct 2014 15:02:34 -0300, Gustavo Zacarias wrote:
> They're obsolete and the package was removed way back in 2010.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  system/skeleton/var/lib/pcmcia | 1 -
>  system/skeleton/var/pcmcia     | 1 -
>  2 files changed, 2 deletions(-)
>  delete mode 120000 system/skeleton/var/lib/pcmcia
>  delete mode 120000 system/skeleton/var/pcmcia

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
