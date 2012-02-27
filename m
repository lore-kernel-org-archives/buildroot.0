From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Feb 2012 10:26:53 +0100
Subject: [Buildroot] [PATCH 2/2] vlc: Patch to get it compiling with
	qt-embedded
In-Reply-To: <1330256732-26483-2-git-send-email-ismael.luceno@gmail.com>
References: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
 <1330256732-26483-2-git-send-email-ismael.luceno@gmail.com>
Message-ID: <4F4B4C5D.4010409@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ismael Luceno wrote:
> ---
>   .../multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch |   33 ++++++++++++++++++++
>   1 files changed, 33 insertions(+), 0 deletions(-)
>   create mode 100644 package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch

In general you should signoff your patches before submission.

But in the case of this one, it looks like a aprt of your other patch
("vlc: new package"). So it should be in the same commit.

>
> diff --git a/package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch b/package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch
> new file mode 100644
> index 0000000..61cd586
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch
> @@ -0,0 +1,33 @@
> +--- a/modules/gui/qt4/qt4.cpp	2012-02-23 22:42:45.760340077 -0200
> ++++ b/modules/gui/qt4/qt4.cpp	2012-02-24 00:13:04.878082822 -0200

Here as well you should state why the patch is needed and where
it comes from.

Luca
