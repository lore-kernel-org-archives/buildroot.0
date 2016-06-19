From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:26:10 +0200
Subject: [Buildroot] [PATCH 010/121] package/gstreamer1: add hash file
In-Reply-To: <4d192a07160d9c41e9abe7e1aaa73a6f7f28c435.1466334225.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 19 Jun 2016 13:08:57 +0200")
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <4d192a07160d9c41e9abe7e1aaa73a6f7f28c435.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <87y4612d65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
 > index b32fcfe..a3a33cb 100644
 > --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
 > +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
 > @@ -1,2 +1,2 @@
 > -# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.2.tar.xz.sha256sum
 > -sha256	9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
 > +# localy computed
 > +sha256  9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz

Just as for gstreamer, I've appended the sha256 to the file.

-- 
Bye, Peter Korsgaard
