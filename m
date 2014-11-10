From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 10 Nov 2014 14:05:49 +0100
Subject: [Buildroot] [PATCH] qt-gstreamer: new package
In-Reply-To: <1415624440-16907-1-git-send-email-jezz@sysmic.org>
References: <1415624440-16907-1-git-send-email-jezz@sysmic.org>
Message-ID: <1431621.J8YT24UtZX@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 10 November 2014 14:00:40 J?r?me Pouiller wrote:
> QtGStreamer is a set of libraries providing C++ bindings for GStreamer
> with a Qt-style API, plus some helper classes and elements for
> integrating GStreamer better in Qt applications.
> 
> Notice that in order to be compatible with gstreamer 0.10 and 1.x, this
> patch add support for either qt-gstreamer 0.10 and 1.x. I hesitated to
> split these two versions in two separate packages. Finaly, I noticed if I
> made two packages there would be a lot of code duplication (even patches
> are exactly sames).
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/Config.in                                  |  1 +
>  package/qt-gstreamer/Config.in                     | 24 ++++++
>  .../qt-gstreamer-0001-install-examples.patch       | 50 +++++++++++++
>  ...eamer-0002-fix-quick1-module-install-path.patch | 12 +++
>  package/qt-gstreamer/qt-gstreamer.mk               | 87
> ++++++++++++++++++++++ 5 files changed, 174 insertions(+)
>  create mode 100644 package/qt-gstreamer/Config.in
>  create mode 100644
> package/qt-gstreamer/qt-gstreamer-0001-install-examples.patch create mode
> 100644
> package/qt-gstreamer/qt-gstreamer-0002-fix-quick1-module-install-path.patch
> create mode 100644 package/qt-gstreamer/qt-gstreamer.mk

Oops, forget this patch, I will post an updated version. Sorry for the noise.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
