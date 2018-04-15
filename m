From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:12:19 +0200
Subject: [Buildroot] [PATCH 1/1] libcap-ng: fix compilation without
 pthread.h
In-Reply-To: <20180415081849.5241-1-fontaine.fabrice@gmail.com>
References: <20180415081849.5241-1-fontaine.fabrice@gmail.com>
Message-ID: <20180415211219.5e3b004e@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 10:18:49 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/6132f33fb282fda3c39deb292784b9006c9e7872
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-compilation-without-pthread.h.patch   | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch

You're now patching configure.ac, so autoreconf is needed. I've added
that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
