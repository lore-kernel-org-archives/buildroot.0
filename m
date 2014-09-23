From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:44:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix compile error on
 arm4/arm5
In-Reply-To: <1411496109-508-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411496109-508-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140923214444.11fa8f76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 23 Sep 2014 20:15:09 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d7e/d7ea8db79210228103257b6a28fada38cca142cb/
> http://autobuild.buildroot.net/results/ec7/ec71e4f16ee9106747dff5f15999cbd17903e76f/
> http://autobuild.buildroot.net/results/be7/be72eb182eaccf0064a32c9dfc2ac1c0d6555506/
> http://autobuild.buildroot.net/results/b35/b35b71e3d21394e7ca24f3b112d8a4047cd6c87b/
> http://autobuild.buildroot.net/results/5bb/5bbc8b5cdcd99229a6813970293f98b044fc489d/
> http://autobuild.buildroot.net/results/be5/be54e75c4171d1db0eaaaeb5f5df29751d7db57b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg-0002-arm4-arm5.patch |   87 ++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 package/ffmpeg/ffmpeg-0002-arm4-arm5.patch

Thanks, applied. I've updated the patch description to indicate that it
has been merged upstream, and in which commit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
