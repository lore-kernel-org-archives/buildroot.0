From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 19:23:55 +0100
Subject: [Buildroot] [PATCH] system/skeleton: remove haldaemon
In-Reply-To: <1414430248-10270-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414430248-10270-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141027192355.1e16350e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 27 Oct 2014 14:17:28 -0300, Gustavo Zacarias wrote:
> We dropped the hal package quite some time ago, and it's not even a
> properly created user.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  system/skeleton/etc/group  | 1 -
>  system/skeleton/etc/passwd | 1 -
>  2 files changed, 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
