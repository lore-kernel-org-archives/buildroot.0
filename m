From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:33:55 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: fix alsa-lib version check
 during configure Current version check ignores MINOR version number
In-Reply-To: <1463643250-13396-1-git-send-email-jiri.novotny@logicelements.cz>
References: <1463643250-13396-1-git-send-email-jiri.novotny@logicelements.cz>
Message-ID: <20160611163355.236f261a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 09:34:10 +0200, Jiri Novotny wrote:
> Signed-off-by: Jiri Novotny <jiri.novotny@logicelements.cz>
> ---
>  .../qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch

Thanks for your contribution! I assume that what this is fixing is the
build with ALSA >= 1.1.x, like we have in Buildroot. So there is a
better fix already merged upstream:
https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066.
So I've used that one instead. See:

  https://git.buildroot.org/buildroot/commit/?id=97959eec223a3708ab67510ea98e2c9e52e7e98f

Let me know if that works for you (or not).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
