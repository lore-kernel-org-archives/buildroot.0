From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 May 2019 23:31:06 +0200
Subject: [Buildroot] [PATCH v5 3/8] package/gstreamer1/gst-omx: bump to
 version 1.16.0
In-Reply-To: <20190502151622.80865-3-aduskett@gmail.com> (aduskett@gmail.com's
 message of "Thu, 2 May 2019 11:16:17 -0400")
References: <20190502151622.80865-1-aduskett@gmail.com>
 <20190502151622.80865-3-aduskett@gmail.com>
Message-ID: <87k1f4a8rp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 > Changes v1 -> v5:
 >   - None

 >  package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 >  package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
 > index 3efd9f3226..fe3256bf73 100644
 > --- a/package/gstreamer1/gst-omx/gst-omx.hash
 > +++ b/package/gstreamer1/gst-omx/gst-omx.hash
 > @@ -1,3 +1,3 @@
 > -# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.4.tar.xz.sha256sum
 > -sha256 969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4 gst-omx-1.14.4.tar.xz
 > +# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.0.tar.xz.sha256sum
 > +sha256 969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4 gst-omx-1.16.0.tar.xz

That doesn't look right. Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
