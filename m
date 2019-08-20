From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 13:20:32 +0200
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-base: fix
 dispmanx option
In-Reply-To: <20190817122402.15366-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 17 Aug 2019 14:24:02 +0200")
References: <20190817122402.15366-1-thomas.petazzoni@bootlin.com>
Message-ID: <87a7c49j7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > There is a typo in the handling of the
 > BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX option: we're adding
 > dispmax to GST1_PLUGINS_BASE_WINSYS_LIST, which causes the following
 > build failure:

 > meson.build:1:0: ERROR: Options "dispmax" are not in allowed choices: "x11, wayland, win32, cocoa, dispmanx, viv-fb, gbm, auto"

 > We fix this by using the proper option name, "dispmanx" instead of the
 > slightly incorrect "dispmax".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
