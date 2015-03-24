From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:43:41 +0100
Subject: [Buildroot] [PATCH] openocd: openjtag needs libusb-compat
In-Reply-To: <72755ca3fda8465a03e156db60d3b035f1653e37.1427219379.git.baruch@tkos.co.il>
References: <72755ca3fda8465a03e156db60d3b035f1653e37.1427219379.git.baruch@tkos.co.il>
Message-ID: <20150325004341.6090cf1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 24 Mar 2015 19:49:39 +0200, Baruch Siach wrote:
> Since commit 9bdf5926 (package/openocd: depends on libftdi1 instead of
> libftdi) the OpenJTAG Programmer can be built without libusb-compat, that is a
> dependency of libftdi (but not libftdi1). This breaks the build, because
> openjtag.c uses libusb-compat headers. Select BR2_PACKAGE_LIBUSB_COMPAT to fix
> this.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d19/d1969e6df56835568fb908b7f252aec0915d9fa4/
> http://autobuild.buildroot.net/results/f06/f06ed6df6138ab399036c397c3f72d33d64fe0a3/
> http://autobuild.buildroot.net/results/bd7/bd7f90f3cc1d2b395f9849eb0630c2602a075bf5/
> ...
> 
> Cc: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
