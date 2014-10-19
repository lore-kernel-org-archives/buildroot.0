From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:10:13 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-cmake.mk: globally
 disable doc, examples and tests
In-Reply-To: <1413741891-30113-2-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
 <1413741891-30113-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20141019221013.090eb47d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 19 Oct 2014 20:04:37 +0200, Samuel Martin wrote:

> +		-DBUILD_DOC=OFF \
> +		-DBUILD_DOCS=OFF \
> +		-DBUILD_EXAMPLE=OFF \
> +		-DBUILD_EXAMPLES=OFF \
> +		-DBUILD_TEST=OFF \
> +		-DBUILD_TESTS=OFF \

Are these options standardized by CMake, or are they just "generally"
used by a number of packages?

If not, I don't see why they should be passed by the
CMake infrastructure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
