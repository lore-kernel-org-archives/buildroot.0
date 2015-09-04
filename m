From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2015 17:07:27 +0200
Subject: [Buildroot] [PATCH v3 1/5] dos2unix: add target support
In-Reply-To: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 3 Sep 2015 07:10:50 +0300")
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
Message-ID: <874mjamde8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: James Knight <james.knight@rockwellcollins.com>
 > Allow the `dos2unix` utility to be built and installed on the target
 > system.

 > [baruch: properly handle target gettext]
 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v3:
 >   * Show only if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is enabled (Peter)
 >   * Add busybox to _DEPENDENCIES

Committed series, thanks!

-- 
Bye, Peter Korsgaard
