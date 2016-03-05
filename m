From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:03:53 +0100
Subject: [Buildroot] [PATCH/next 1/7] package/vlc: bump version to 2.2.2
In-Reply-To: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456690708-6458-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305150353.18b594ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Feb 2016 21:18:22 +0100, Bernd Kuhls wrote:
> Removed two patches applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...opencv_wrapper-use-opencv2-style-includes.patch | 36 ----------------------
>  ...cv_example-add-missing-include-statements.patch | 29 -----------------
>  package/vlc/vlc.hash                               |  4 +--
>  package/vlc/vlc.mk                                 |  2 +-
>  4 files changed, 3 insertions(+), 68 deletions(-)
>  delete mode 100644 package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
>  delete mode 100644 package/vlc/0009-opencv_example-add-missing-include-statements.patch

Entire series applied to master, thanks. It would however be great if
there was an effort to submit our VLC patches upstream. Maybe are
perfectly good patches that could be submitted upstream with almost no
change.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
