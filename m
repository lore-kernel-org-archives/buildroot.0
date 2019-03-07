From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:32:32 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/gst-plugins-bad: remove apexsink support
In-Reply-To: <20190305220104.16670-1-fontaine.fabrice@gmail.com>
References: <20190305220104.16670-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307223232.0755099d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Mar 2019 23:01:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apexsink does not build with OpenSSL 1.1.x so remove this option
> especially because there is no more apexsink option in gstreamer1 (since
> version 1.12)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a29e8a8509190fc4b3c419dae2301cf72a601f62
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update commit message with information about gstreamer1

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
