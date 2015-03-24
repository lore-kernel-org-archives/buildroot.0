From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 24 Mar 2015 22:29:06 +0100
Subject: [Buildroot] [PATCH] openocd: openjtag needs libusb-compat
In-Reply-To: <72755ca3fda8465a03e156db60d3b035f1653e37.1427219379.git.baruch@tkos.co.il>
References: <72755ca3fda8465a03e156db60d3b035f1653e37.1427219379.git.baruch@tkos.co.il>
Message-ID: <CAHXCMMLM7Hp37eShxeLC+ZjnqN5eaXW5M2C0-7KJabDy0Dq4ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

On Tue, Mar 24, 2015 at 6:49 PM, Baruch Siach <baruch@tkos.co.il> wrote:
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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
