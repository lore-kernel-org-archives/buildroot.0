From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 12:00:28 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to
 3.4.2
In-Reply-To: <20180212165106.18383-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 12 Feb 2018 17:51:06 +0100")
References: <20180212165106.18383-1-bernd.kuhls@t-online.de>
Message-ID: <87tvuimsab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/ffmpeg/ffmpeg.hash | 2 +-
 >  package/ffmpeg/ffmpeg.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
 > index cdf740834b..a8092616a9 100644
 > --- a/package/ffmpeg/ffmpeg.hash
 > +++ b/package/ffmpeg/ffmpeg.hash
 > @@ -1,5 +1,5 @@
 >  # Locally calculated
 > -sha256 5a77278a63741efa74e26bf197b9bb09ac6381b9757391b922407210f0f991c0  ffmpeg-3.4.1.tar.xz
 > +sha256 2b92e9578ef8b3e49eeab229e69305f5f4cbc1fdaa22e927fc7fca18acccd740  ffmpeg-3.4.2.tar.xz
 >  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 >  sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 >  sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
 > diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
 > index 76c31f5f52..5d2f89fb43 100644
 > --- a/package/ffmpeg/ffmpeg.mk
 > +++ b/package/ffmpeg/ffmpeg.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -FFMPEG_VERSION = 3.4.1
 > +FFMPEG_VERSION = 3.4.2

Is this not 'master' material? Doesn't this only contain bugfixes
relative to 3.4.1?

-- 
Bye, Peter Korsgaard
