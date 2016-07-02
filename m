From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:47:38 +0200
Subject: [Buildroot] [PATCH v4 2/7] package/ffmpeg: bump to version 3.1.1
In-Reply-To: <E1bJM6V-0004mv-DY@fli4l.lan.fli4l>
References: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
 <1467466339-19422-2-git-send-email-bernd.kuhls@t-online.de>
 <20160702153815.58f45f35@free-electrons.com>
 <E1bJM6V-0004mv-DY@fli4l.lan.fli4l>
Message-ID: <20160702164738.069ebb30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 02 Jul 2016 16:41:07 +0200, Bernd Kuhls wrote:

> the next Kodi bump will require ffmpeg 3, but this will be several months 
> away. As usual I am posting parts of my Kodi patch series which can be used 
> today to reduce the amount of patches for review.
> 
> For details please read
> http://lists.busybox.net/pipermail/buildroot/2016-July/165924.html

OK. Since Kodi 17 will not be released before several months, I would
suggest for now to keep the ffmpeg 3.x bump on the side, and see if the
VLC people finally release their 3.x version. If they don't and we see
the Kodi 17 release date approaching, then we will take your bump, and
use a Git version for VLC.

How does that sound?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
