From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:37:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] libfreeimage: new package
In-Reply-To: <1428916598-16537-1-git-send-email-remi.rerolle@gmail.com>
References: <1428916598-16537-1-git-send-email-remi.rerolle@gmail.com>
Message-ID: <20150413223746.00559f3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear R?mi R?rolle,

On Mon, 13 Apr 2015 11:16:38 +0200, R?mi R?rolle wrote:
> FreeImage is an Open Source library project for developers who would like to
> support popular graphics image formats like PNG, BMP, JPEG, TIFF and others as
> needed by today's multimedia applications.
> 
> See: http://freeimage.sourceforge.net
> 
> Signed-off-by: R?mi R?rolle <remi.rerolle@gmail.com>

Applied, after doing some small additional changes:

    [Thomas:
      - add hash file
      - add dependency on !BR2_STATIC_LIBS, since the build system of
        libfreeimage always tries to build a shared library.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
