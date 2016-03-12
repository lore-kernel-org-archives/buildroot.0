From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 23:55:19 +0100
Subject: [Buildroot] [PATCH] bash re-enable parallel builds
In-Reply-To: <1457720871-10472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457720871-10472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160312235519.11c850ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 11 Mar 2016 15:27:51 -0300, Gustavo Zacarias wrote:
> They don't seem to be causing any issues after bumping to the 4.3.x
> series and several tests.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bash/bash.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
