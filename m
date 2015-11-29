From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:26:48 +0100
Subject: [Buildroot] [PATCH] yad: needs gtk3-x11
In-Reply-To: <1448797190-18243-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448797190-18243-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151129142648.6ecb417d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 29 Nov 2015 08:39:50 -0300, Gustavo Zacarias wrote:
> Doesn't build with broadway or wayland since it wants the X-variant of
> gdk. Fixes:
> http://autobuild.buildroot.net/results/91d/91dc6ab749f967ae046f856f3f592d5a548499c6/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/yad/yad.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
