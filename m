From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jun 2012 17:02:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-06-13
In-Reply-To: <CAPNngRN=e2BaOgMutb-xiDuy-mxs-sO_6YpJ1sb8ezGr+ZXjLA@mail.gmail.com>
References: <20120614063146.7563852CEB3@lolut.humanoidz.org>
 <CAPNngRMBN95AdPLA8LrOwUhSVEM1p_VRtTUyf_wbO9T5JHfeFw@mail.gmail.com>
 <20120615101917.2c757be3@skate>
 <CAPNngRN=e2BaOgMutb-xiDuy-mxs-sO_6YpJ1sb8ezGr+ZXjLA@mail.gmail.com>
Message-ID: <20120615170203.6bc1e19a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 15 Jun 2012 11:57:42 -0300,
Milton Soares Filho <milton.soares.filho@gmail.com> a ?crit :

> Perhaps including another field at the summary just to tell the type
> of the toolchain would be enough. The use-case is filter-out
> configurations where other users can not easily reproduce the
> conditions whether the build has failed, such as custom external
> toolchains provided by third-parties or paid-for development kits.

None of the toolchains that are currently being used for the autobuild
tests are private toolchains. They are either:
 * Publicly available CodeSourcery toolchains
 * Publicly available Linaro toolchains
 * Toolchains built with Crosstool-NG
 * Toolchains built with Buildroot

I think we should rather document how to get or build those toolchains,
or even make them available (easy for CodeSourcery, Linaro and
Crosstool-NG, more complicated for Buildroot toolchains since those
toolchains are not relocatable as of today).

Since about 90% of the builds are done with external toolchains, simply
filtering out all test cases done with external toolchains will just
leave you with only a few test builds.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
