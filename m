From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Feb 2019 19:53:50 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
References: <20190206094727.24dfa441@windsurf>
 <ea-mime-5c5aa9fc-6f58-26e2ec99@www-1.netcourrier.com>
 <20190206104749.1ae23e1b@windsurf>
 <1c95jfxr7e.ln2@ID-313208.user.individual.net>
 <20190210112702.5dc174c6@windsurf.home>
Message-ID: <ui86jfxr7e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 10 Feb 2019 11:27:02 +0100 schrieb Thomas Petazzoni:

> Then, what about temporarily using the internal ffmpeg copy in
> gst-libav, until a new version of gst-libav gets released ?

Hi Thomas,

sent patch: http://patchwork.ozlabs.org/patch/1039476/

test-pkg with this defconfig

BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_LIBAV=y

looks good:

                             arm-aarch64 [ 1/48]: OK
                armv5-ctng-linux-gnueabi [ 2/48]: OK
              armv7-ctng-linux-gnueabihf [ 3/48]: OK
                        br-aarch64-glibc [ 4/48]: OK
                           br-arcle-hs38 [ 5/48]: OK
                            br-arm-basic [ 6/48]: SKIPPED
                  br-arm-cortex-a9-glibc [ 7/48]: OK
                   br-arm-cortex-a9-musl [ 8/48]: OK
                   br-arm-cortex-m4-full [ 9/48]: SKIPPED
                             br-arm-full [10/48]: OK
                    br-arm-full-nothread [11/48]: SKIPPED

Regards, Bernd
