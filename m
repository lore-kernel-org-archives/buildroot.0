From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:23:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: fix musl build
In-Reply-To: <1454101549-32130-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454101549-32130-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207152342.638320b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 29 Jan 2016 22:05:49 +0100, Bernd Kuhls wrote:
> Fixes build errors in previous version which are still present
> http://autobuild.buildroot.net/results/879/879260f0efc80c2c9061d89d3e99ad107083f72a/
> http://autobuild.buildroot.net/results/1e5/1e5f6a5f349800226d8b07601dab68ffe7794461/
> http://autobuild.buildroot.net/results/0f8/0f8d68b11c6807a9d1d4c40a66430ac096902720/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-padsp-Make-it-compile-on-musl.patch       | 79 ++++++++++++++++++++++
>  package/pulseaudio/0002-musl-fixes.patch           | 44 ++++++++++++
>  package/pulseaudio/pulseaudio.mk                   |  2 +
>  3 files changed, 125 insertions(+)
>  create mode 100644 package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
>  create mode 100644 package/pulseaudio/0002-musl-fixes.patch

Applied after some changes:

    [Thomas:
     - Rework patch 0001-padsp-Make-it-compile-on-musl.patch to put
       Bernd's comment and SoB *after* the original commit log.
     - Rework patch 0002-musl-fixes.patch for the same reason, and also to
       remove the xlocale.h part, which has already been fixed upstream.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
