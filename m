From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:30:44 +0200
Subject: [Buildroot] [PATCH] arch/sparc: doesn't have atomics
In-Reply-To: <1427636469-9491-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427636469-9491-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330233044.591124bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 29 Mar 2015 10:41:09 -0300, Gustavo Zacarias wrote:
> Cores older than v9 don't seem to have atomics so remove it.
> Fixes a test build of pulseaudio for example.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  arch/Config.in.sparc | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
