From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:39:36 +0100
Subject: [Buildroot] [PATCH next v8 4/6] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <20191105164646.23820-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 5 Nov 2019 17:46:43 +0100")
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
 <20191105164646.23820-5-thomas.petazzoni@bootlin.com>
Message-ID: <87a78eagrb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The pkg-kconfig infrastructure hijacks the regular chain of build
 > steps to insert its own step to prepare the configuration of kconfig
 > packages. This additional step may have dependencies of its own, such
 > as host-flex, host-bison or toolchain.

 > In the context of per-package directory support, those dependencies
 > must be copied to the per-package directory of the current package
 > prior to doing the config preparation. This commit implements this
 > logic by adding a call to prepare-per-package-directory at the right
 > spot.

 > Reported-by: Andreas Naumann <anaumann@ultratronik.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
