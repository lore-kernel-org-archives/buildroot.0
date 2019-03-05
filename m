From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:22:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: remove
 apexsink support
In-Reply-To: <20190305192032.14244-1-fontaine.fabrice@gmail.com>
References: <20190305192032.14244-1-fontaine.fabrice@gmail.com>
Message-ID: <20190305212203.2f7d4b33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue,  5 Mar 2019 20:20:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apexsink does not build with OpenSSL 1.1.x so remove this option

Just curious: was this build issue fixed in newer version of GStreamer ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
