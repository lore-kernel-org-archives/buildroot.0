From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 22:54:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: remove
 apexsink support
In-Reply-To: <CAPi7W80pG6O-jJqSL6KTC-eNhPdCZW2ZPAfKEcOSLEwGC5gwuw@mail.gmail.com>
References: <20190305192032.14244-1-fontaine.fabrice@gmail.com>
 <20190305212203.2f7d4b33@windsurf>
 <CAPi7W80pG6O-jJqSL6KTC-eNhPdCZW2ZPAfKEcOSLEwGC5gwuw@mail.gmail.com>
Message-ID: <20190305225458.55d987be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Mar 2019 22:06:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > > apexsink does not build with OpenSSL 1.1.x so remove this option  
> >
> > Just curious: was this build issue fixed in newer version of GStreamer ?  
> There is no more apexsink option in gstreamer1 (since version 1.12).

OK, so this is another reason to drop apexsink support. I guess it
should be mentioned in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
