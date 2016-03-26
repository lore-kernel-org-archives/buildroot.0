From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:37:30 +0100
Subject: [Buildroot] [PATCH 1/5] cairo: enable opengl for cairo-gl
In-Reply-To: <1459020911-20593-2-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
 <1459020911-20593-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160326213730.61c0f07f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Mar 2016 16:35:07 -0300, Gustavo Zacarias wrote:
> If OpenGL is enabled then enable cairo-gl.
> However if GLESv2 is also present we must choose which implementation to
> use.
> Since normally OpenGL is more featured, has more dependencies and
> wouldn't be present "by accident" it seems like the logical choice to
> win over it.
> 
> This feature is useful for webkitgtk's accelerated 2d canvas.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/cairo/cairo.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
