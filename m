From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:54:34 +0200
Subject: [Buildroot] [WIP PATCH 1/5] uclibc: don't install tools to
 staging when static
In-Reply-To: <1401055980-28742-2-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <1401055980-28742-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140715205434.7d711c87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 25 May 2014 19:12:56 -0300, Gustavo Zacarias wrote:
> Don't try to install ld* tools to staging when it's a static build,
> there's no point and it'll be broken once we build a purely-static
> uclibc.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/uclibc/uclibc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
