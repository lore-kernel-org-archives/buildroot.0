From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:27:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/glmark2: Wayland-gl support
 also needs egl
In-Reply-To: <1448801858-22306-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448801858-22306-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151129142705.58ee422b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Nov 2015 13:57:38 +0100, Bernd Kuhls wrote:
> We were missing the egl dependency when enabling Wayland GL support:
> https://github.com/glmark2/glmark2/blob/master/src/wscript_build#L28
> 
> Fixes
> http://autobuild.buildroot.net/results/858/8587d0cea86efa4c6e98817cadc7cce0b1b36e3d/
> http://autobuild.buildroot.net/results/1f6/1f6853d5f7a83be60ccdf4f071a1df1491cf8137/
> http://autobuild.buildroot.net/results/a4d/a4d830291ee8550b3c544ade7169218d5edd4d52/
> http://autobuild.buildroot.net/results/536/536a8dc62783633943770a278dc9f1c6c5c0807c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/glmark2/glmark2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
