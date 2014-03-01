From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 15:36:51 +0100
Subject: [Buildroot] [PATCH] systemd: ditch autoreconf
In-Reply-To: <1393601189-17764-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393601189-17764-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301153651.2ab7fa9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 28 Feb 2014 12:26:29 -0300, Gustavo Zacarias wrote:
> It needs AM_PATH_LIBGCRYPT and will bail out if ALL_EXTRAS (libgcrypt)
> isn't around - and it doesn't seem to be used at all.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/systemd/systemd.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
