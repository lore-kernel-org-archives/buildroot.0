From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 5 Mar 2019 22:06:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: remove
 apexsink support
In-Reply-To: <20190305212203.2f7d4b33@windsurf>
References: <20190305192032.14244-1-fontaine.fabrice@gmail.com>
 <20190305212203.2f7d4b33@windsurf>
Message-ID: <CAPi7W80pG6O-jJqSL6KTC-eNhPdCZW2ZPAfKEcOSLEwGC5gwuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
Le mar. 5 mars 2019 ? 21:22, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Tue,  5 Mar 2019 20:20:32 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > apexsink does not build with OpenSSL 1.1.x so remove this option
>
> Just curious: was this build issue fixed in newer version of GStreamer ?
There is no more apexsink option in gstreamer1 (since version 1.12).
However, the hls option which also depends on openssl has been updated
to support openssl 1.1.x
(https://github.com/GStreamer/gst-plugins-bad/commit/e796a7cb974a361bd4463a71aed4e1256cfe2df6)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
