From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:28:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: libX11 is an optional
 dependency for the qt4 module
In-Reply-To: <1430154085-23534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430154085-23534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150427232811.6287ade9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 27 Apr 2015 19:01:25 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d15/d158095d4caa8f58f1d205aeeb1ae707a1311ea5/
> http://autobuild.buildroot.net/results/343/343e2981b60d9d09a4fcd8e2109540f0dc11b402/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0006-qt-x11.patch |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 package/vlc/0006-qt-x11.patch

Applied, thanks, but please submit the patch to upstream VLC.

Thanks again,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
